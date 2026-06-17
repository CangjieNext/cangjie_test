package qwe
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// for i in {1..1000}; do ./main; done
// scale=1，如果放在spawn里就有概率卡死，如果不放在spawn里就不会卡死
// 如果放spawn里，如果不是在析构函数里，而是另外spawn一个线程，就不会卡死
// 必须同时是析构函数且spawn中执行才会卡死

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// E-RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.sync.*
import std.collection.*

public abstract class Device {
    public func finalizerThread(index: Int64): Unit
    public func mainThread(index: Int64): Unit
    public func createInstance(index: Int64): Unit {
        println("main_thread#${index} create instance")
        blackBox(C(this, index))
        println("main_thread#${index} trigger GC")
        gc(heavy: true)
        println("main_thread#${index} trigger GC done")
    }
}

public class SemaphoreDevice <: Device {
    public SemaphoreDevice() {
    }
    let done = Barrier(2)
    let gSemaphore = Semaphore(1)
    let waitForFinalizer = Barrier(2)

    public func finalizerThread(index: Int64): Unit {
        println("finalizer#${index} has been started, tell main_thread to go ahead.")
        waitForFinalizer.wait()
        println("finalizer#${index} trying to gSemaphore.acquire(amount: 1)")
        gSemaphore.acquire(amount: 1)
        println("finalizer#${index} gSemaphore.acquire(amount: 1) successfully")
        doSomeJobs()
        println("finalizer#${index} gSemaphore.release(amount: 1)")
        gSemaphore.release(amount: 1)
        println("finalizer#${index} gSemaphore.release(amount: 1) done")
        done.wait()
        println("finalizer#${index} done")
    }
    public func mainThread(index: Int64): Unit {
        println("main_thread#${index} trying to gSemaphore.acquire(amount: 1)")
        gSemaphore.acquire(amount: 1)
        println("main_thread#${index} gSemaphore.acquire(amount: 1) successfully")

        createInstance(index)

        println("main_thread#${index} waiting for finalizer to start.")
        waitForFinalizer.wait()
        println("main_thread#${index} sleep for 2s")
        sleep(Duration.nanosecond * 2)
        println("main_thread#${index} sleep for 2s done and gSemaphore.release(amount: 1)")
        gSemaphore.release(amount: 1)
        println("main_thread#${index} now waiting for finalizer done")
        done.wait()
        println("main_thread#${index} done.")
    }
}

public class ProducerConsumerExample <: Device {
    private static const SCALE = 100
    let done = Barrier(2)
    private let queue = ArrayQueue<Int64>()
    private static const CAPACITY = 5
    private let lock = Mutex()
    private let cond = synchronized(lock) {
        lock.condition()
    }
    private let counter = AtomicInt64(0)

    public func produce(index: Int64): Unit {
        while (counter.load() < SCALE) {
            // producing.
            synchronized(this.lock) {
                while (queue.size == CAPACITY) {
                    println("#${index}queue full, producer waiting...")
                    cond.wait()
                }
                counter.fetchAdd(1)
                let value = counter.load()
                queue.add(value)
                println("producer#${index} produced: ${value}")
                cond.notifyAll()
            }
            // producer生产速率慢一点，让consumer能够触发wait，使得析构函数中得以阻塞等待锁
            sleep(Duration.nanosecond * 1000000)
        }
    }
    public func consume(index: Int64): Unit {
        while (counter.load() < SCALE) {
            synchronized(lock) {
                while (queue.isEmpty()) {
                    println("#${index}queue is empty, consumer waiting...")
                    cond.wait()
                }
                let value = queue.remove().getOrThrow()
                println("consumer#${index} consumed: ${value}")

                // notify producer
                cond.notifyAll()
            }
            sleep(Duration.nanosecond)
        }
        done.wait()
    }
    public func mainThread(index: Int64): Unit {
        createInstance(index)

        // 主线程中开启多个线程进行produce
        spawn {
            produce(index)
        }
        done.wait()
    }
    public func finalizerThread(index: Int64): Unit {
        // 析构线程中则只有一个consumer，当消费掉累计SCALE个产品后析构函数结束
        consume(index)
    }
}

public class AlternatePrint <: Device {
    private static const SCALE = 2000
    private let counter = AtomicInt64(1)
    private let lock = Mutex()
    public let done = Barrier(2)
    private let cond = synchronized(lock) {
        lock.condition()
    }
    public func printOdd(index: Int64): Unit {
        synchronized(lock) {
            while (counter.load() <= SCALE) {
                if (counter.load() % 2 == 0) {
                    // 等待偶数线程打印
                    cond.wait()
                } else {
                    println("#${index}: printOdd: ${counter.load()}")
                    counter.fetchAdd(1)
                    // 唤醒偶数打印线程
                    cond.notifyAll()
                }
            }
        }
    }
    public func printEven(index: Int64): Unit {
        synchronized(lock) {
            while (counter.load() <= SCALE) {
                if (counter.load() % 2 != 0) {
                    // 等待奇数线程打印
                    cond.wait()
                } else {
                    println("#${index}: printEven: ${counter.load()}")
                    counter.fetchAdd(1)
                    // 唤醒奇数打印线程
                    cond.notifyAll()
                }
            }
        }
    }
    public func mainThread(index: Int64): Unit {
        createInstance(index)
        // let odd = spawn {
        //     printOdd(index)
        // }
        let even = spawn {
            printEven(index)
        }
        // odd.get()
        // even.get()
    }
    public func finalizerThread(index: Int64): Unit {
        printOdd(index)
    }
}

const scale = 8
// public let devices: Array<Device> = [SemaphoreDevice(), ProducerConsumerExample(), AlternatePrint()]
public let devices: Array<Device> = [AlternatePrint(), SemaphoreDevice()]

public class C {
    public C(public let device: Device, public let index: Int64) {
    }

    ~init() {
        device.finalizerThread(this.index)
    }
}

public func doSomeJobs(): Unit {
    sleep(Duration.nanosecond)
}

main(): Unit {
    let arr = ArrayList<Future<Unit>>()
    for (index in 0..scale) {
        let device = devices[index % devices.size]
        arr.add(spawn {
            device.mainThread(index)
        })
    }

    for (f in arr) {
        f.get()
    }
}
