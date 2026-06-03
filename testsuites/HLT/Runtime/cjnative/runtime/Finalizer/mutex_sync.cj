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

let done = Monitor()
let gMutex = Mutex()
let gCond = synchronized(gMutex) {
    gMutex.condition()
}
var gReady: Bool = false

func syncMutex1(): Unit {
    synchronized(gMutex) {
        println("C: ~init before wait")
        while (!gReady) {
            gCond.wait()
        }
        println("C: ~init after wait")
    }
    synchronized(done) {
        done.notifyAll()
    }
}

main(): Unit {
    let notifier = spawn {
        sleep(Duration.second * 2)
        synchronized(gMutex) {
            gReady = true
            println("notifier: notify finalizer")
            gCond.notifyAll()
        }
    }
    let c = C(syncMutex1)
    blackBox(c)
    println("main: trigger gc")
    gc(heavy: true)
    println("main: gc returned")
    notifier.get()
    synchronized(done) {
        @Assert(done.wait(timeout: Duration.second * 50))
    }
}
