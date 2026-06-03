package qwe
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// for i in {1..1000}; do ./main; done
// 1. 有概率卡死
// 2. finalizer中的println有概率不会被打印出来，很奇怪，且肯能是3个finalizer中的任何一个
// 3. 当scale=3000时，问题是一样的，也是会在某一个finalizer执行过程中卡死

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// E-RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.sync.*
import std.collection.*

const scale = 3

public abstract class Device {
    public func finalizerThread(index: Int64): Unit
    public func mainThread(index: Int64): Unit
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

        println("main_thread#${index} create instance")
        blackBox(C(this, index))
        println("main_thread#${index} trigger GC")
        gc(heavy: true)
        println("main_thread#${index} trigger GC done")

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

// public class MonitorDevice <: Device {
//     public MonitorDevice() {
//     }
//     let done = Barrier(2)
// let gMonitor = Monitor()
//     let waitForFinalizer = Barrier(2)

//     public func finalizerThread(index: Int64): Unit {
//         println("finalizer#${index} has been started, tell main_thread to go ahead.")
//         waitForFinalizer.wait()
//         println("finalizer#${index} trying to gSemaphore.acquire(amount: 1)")
//         gSemaphore.acquire(amount: 1)
//         println("finalizer#${index} gSemaphore.acquire(amount: 1) successfully")
//         doSomeJobs()
//         println("finalizer#${index} gSemaphore.release(amount: 1)")
//         gSemaphore.release(amount: 1)
//         println("finalizer#${index} gSemaphore.release(amount: 1) done")
//         done.wait()
//         println("finalizer#${index} done")
//     }
//     public func mainThread(index: Int64): Unit {
//         println("main_thread#${index} trying to gSemaphore.acquire(amount: 1)")
//         gSemaphore.acquire(amount: 1)
//         println("main_thread#${index} gSemaphore.acquire(amount: 1) successfully")
//         println("main_thread#${index} waiting for finalizer to start.")
//         waitForFinalizer.wait()
//         println("main_thread#${index} sleep for 2s")
//         sleep(Duration.second * 2)
//         println("main_thread#${index} sleep for 2s done and gSemaphore.release(amount: 1)")
//         gSemaphore.release(amount: 1)
//         println("main_thread#${index} now waiting for finalizer done")
//         done.wait()
//         println("main_thread#${index} done.")
//     }
// }

public let devices: Array<Device> = [SemaphoreDevice()]

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
