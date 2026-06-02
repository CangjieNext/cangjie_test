// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f

internal import std.runtime.*
internal import std.sync.*

func allocate(): Unit {
    // Create 100 Monitor
    for (i in 0..100) {
        let mtx = MultiConditionMonitor()
        // Create 10000 conditonID
        synchronized(mtx) {
            for (j in 0..1000) {
                mtx.newCondition()
            }
        }
    }
    // Release them
}

func test(): Unit {
    for (i in 0..100) {
        allocate()
        GC()
    }
}

main() {
    test()
    println("Done")
    return 0
}

/* SCAN
Done
*/
