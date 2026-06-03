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
let done = Array(scale) {_ => Barrier(2)}
let gSemaphore = Array(scale) {_ => Semaphore(1)}
let waitForFinalizer = Array(scale) {_ => Barrier(2)}

public func callBack(index: Int64): Unit {
    println("finalizer has been started, tell main thread to go ahead.")
    waitForFinalizer[index].wait()
    println("finalizer trying to gSemaphore.acquire(amount: 1)")
    gSemaphore[index].acquire(amount: 1)
    println("finalizer gSemaphore.acquire(amount: 1) successfully")
    doSomeJobs()
    println("finalizer gSemaphore.release(amount: 1)")
    gSemaphore[index].release(amount: 1)
    println("finalizer gSemaphore.release(amount: 1) done")
    done[index].wait()
    println("finalizer done")
}

public class C {
    public C(public let index: Int64) {
    }

    ~init() {
        // 注释掉这行，就可以过
        callBack(this.index)
    }
}

public func doSomeJobs(): Unit {
    sleep(Duration.millisecond * 10)
}

main(): Unit {
    for (index in 0..1) {
        spawn {
            println("main thread trying to gSemaphore.acquire(amount: 1)")
            gSemaphore[index].acquire(amount: 1)
            println("main thread gSemaphore.acquire(amount: 1) successfully")
            println("creating instance")
            let c = C(index)
            blackBox(c)
            println("main: trigger gc")
            gc(heavy: true)
            // spawn {
            //     callBack(index)
            // }
            println("main: gc returned")
            println("waiting for finalizer to start.")
            waitForFinalizer[index].wait()
            println("main thread sleep for 2s")
            sleep(Duration.second * 2)
            println("main thread sleep for 2s done and gSemaphore.release(amount: 1)")
            gSemaphore[index].release(amount: 1)
            println("main thread now waiting for finalizer done")
            done[index].wait()
            println("main thread done.")
        }
    }
}
