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
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.sync.*
import std.collection.*

const scale = 1

public interface Device {
    func finalizerThread(): Unit
    func mainThread(): Unit
}

public class SemaphoreDevice <: Device {
    let done = Barrier(2)
    let gSemaphore = Semaphore(1)
    let waitForFinalizer = Barrier(2)

    public func finalizerThread(): Unit {
        println("finalizer# has been started, tell main_thread# to go ahead.")
        waitForFinalizer.wait()
        println("finalizer# trying to gSemaphore.acquire(amount: 1)")
        gSemaphore.acquire(amount: 1)
        println("finalizer# gSemaphore.acquire(amount: 1) successfully")
        doSomeJobs()
        println("finalizer# gSemaphore.release(amount: 1)")
        gSemaphore.release(amount: 1)
        println("finalizer# gSemaphore.release(amount: 1) done")
        done.wait()
        println("finalizer# done")
    }
    public func mainThread(): Unit {
        println("main_thread# trying to gSemaphore.acquire(amount: 1)")
        gSemaphore.acquire(amount: 1)
        println("main_thread# gSemaphore.acquire(amount: 1) successfully")
        println("creating instance")
        println("waiting for finalizer to start.")
        waitForFinalizer.wait()
        println("main_thread# sleep for 2s")
        sleep(Duration.second * 2)
        println("main_thread# sleep for 2s done and gSemaphore.release(amount: 1)")
        gSemaphore.release(amount: 1)
        println("main_thread# now waiting for finalizer done")
        done.wait()
        println("main_thread# done.")
    }
}

public let devices: Array<Device> = [SemaphoreDevice()]

public class C {
    public C(public let device: Device) {
    }

    ~init() {
        device.finalizerThread()
    }
}

public func doSomeJobs(): Unit {
    sleep(Duration.millisecond * 10)
}

main(): Unit {
    let arr = ArrayList<Future<Unit>>()
    for (index in 0..scale) {
        let device = devices[index % devices.size]
        blackBox(C(device))
        arr.add(spawn {
            device.mainThread()
        })
    }
    println("main: trigger gc")
    gc(heavy: true)
    println("main: gc returned")
    for (f in arr) {
        f.get()
    }
}
