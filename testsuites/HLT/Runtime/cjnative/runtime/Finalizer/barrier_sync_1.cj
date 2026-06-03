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

let gBarrier = Barrier(3)

func syncBarrier(): Unit {
    println("syncBarrier wait before")
    gBarrier.wait()
    println("syncBarrier wait after")
}

main(): Unit {
    let notifier = spawn {
        sleep(Duration.second * 2)
        gBarrier.wait()
    }
    let c = C(syncBarrier)
    blackBox(c)
    println("main: trigger gc")
    gc(heavy: true)
    println("main: gc returned")
    gBarrier.wait()
}
