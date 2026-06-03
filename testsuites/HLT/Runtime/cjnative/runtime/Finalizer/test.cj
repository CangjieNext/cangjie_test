/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./the_class.cj
// EXEC: %compiler %cmp_opt %f ./the_class.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.common.*

let done = Barrier(2)
let gSemaphore = Semaphore(1)
let waitForFinalizer = Barrier(2)
let consoleLock = Mutex()

public func exec(f: () -> Unit): Unit {
    synchronized(consoleLock) {
        f()
    }
}

public func doSomeJobs(): Unit {
    sleep(Duration.millisecond * 10)
}

func testSemaphore(): Unit {
    exec {
        println("finalizer has been started, tell main thread to go ahead.")
        waitForFinalizer.wait()
    }
    exec {
        println("finalizer trying to gSemaphore.acquire(amount: 1)")
        gSemaphore.acquire(amount: 1)
        println("finalizer gSemaphore.acquire(amount: 1) successfully")
    }
    doSomeJobs()

    exec {
        println("finalizer gSemaphore.release(amount: 1)")
        gSemaphore.release(amount: 1)
        println("finalizer gSemaphore.release(amount: 1) done")
    }
    exec {
        done.wait()
        println("finalizer done")
    }
}

main(): Unit {
    exec {
        println("main thread trying to gSemaphore.acquire(amount: 1)")
        gSemaphore.acquire(amount: 1)
        println("main thread gSemaphore.acquire(amount: 1) successfully")
    }
    exec {
        println("creating instance")
        let c = C(testSemaphore)
        blackBox(c)
        println("main: trigger gc")
        gc(heavy: true)
        println("main: gc returned")
    }
    exec {
        println("waiting for finalizer to start.")
        waitForFinalizer.wait()
    }
    exec {
        println("main thread sleep for 2s")
        sleep(Duration.second * 2)
    }
    exec {
        println("main thread sleep for 2s done and gSemaphore.release(amount: 1)")
        gSemaphore.release(amount: 1)
        println("main thread now waiting for finalizer done")
    }
    exec {
        done.wait()
        println("main thread done.")
    }
}
