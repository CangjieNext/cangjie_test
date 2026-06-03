/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// for i in {1..1000}; do ./main; done
// 当scale=1时无问题，当scale=3时有问题，会概率性卡死
// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.sync.*
import std.collection.*

const scale = 3
let done = Array(scale) {_ => Barrier(2)}
let gSemaphore = Array(scale) {_ => Semaphore(1)}
let waitForFinalizer = Array(scale) {_ => Barrier(2)}

public func callBack(index: Int64): Unit {
    println("finalizer#${index} has been started, tell main_thread#${index} to go ahead.")
    waitForFinalizer[index].wait()
    println("finalizer#${index} trying to gSemaphore.acquire(amount: 1)")
    gSemaphore[index].acquire(amount: 1)
    println("finalizer#${index} gSemaphore.acquire(amount: 1) successfully")
    doSomeJobs()
    println("finalizer#${index} gSemaphore.release(amount: 1)")
    gSemaphore[index].release(amount: 1)
    println("finalizer#${index} gSemaphore.release(amount: 1) done")
    done[index].wait()
    println("finalizer#${index} done")
}

public class C {
    public C(public let index: Int64) {
    }

    ~init() {
        callBack(this.index)
    }
}

public func doSomeJobs(): Unit {
    sleep(Duration.millisecond * 10)
}

main(): Unit {
    let arr = ArrayList<Future<Unit>>()
    for (index in 0..scale) {
        let c = C(index)
        blackBox(c)
        println("main: trigger gc")
        gc(heavy: true)
        println("main: gc returned")
        arr.add(spawn {
            println("main_thread#${index} trying to gSemaphore.acquire(amount: 1)")
            gSemaphore[index].acquire(amount: 1)
            println("main_thread#${index} gSemaphore.acquire(amount: 1) successfully")
            println("creating instance")
            println("waiting for finalizer to start.")
            waitForFinalizer[index].wait()
            println("main_thread#${index} sleep for 2s")
            sleep(Duration.second * 2)
            println("main_thread#${index} sleep for 2s done and gSemaphore.release(amount: 1)")
            gSemaphore[index].release(amount: 1)
            println("main_thread#${index} now waiting for finalizer done")
            done[index].wait()
            println("main_thread#${index} done.")
        })
    }
    for (f in arr) {
        f.get()
    }
}
