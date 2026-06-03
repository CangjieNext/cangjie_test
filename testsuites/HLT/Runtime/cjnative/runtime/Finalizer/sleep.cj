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
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan check true, true

import std.runtime.*
import std.sync.*
import std.collection.*
import std.time.*

let done = Barrier(2)

func testSleep(): Unit {
    println("start sleeping")
    let start = DateTime.now()
    sleep(Duration.second * 5)
    let end = DateTime.now()
    println("end sleeping")
    let elapsed = end - start
    println("time elapsed: ${elapsed}, check ${elapsed > Duration.second * 4.5}, ${elapsed < Duration.second * 5.5}")
    done.wait()
}

main(): Unit {
    let c = C(testSleep)
    blackBox(c)
    println("main: trigger gc")
    gc(heavy: true)
    println("main: gc returned")
    done.wait()
}
