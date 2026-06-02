/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.sync.*
import std.time.*

main(): Int64 {
    let a = AtomicInt64(0)
    let arr = ArrayList<Future<Unit>>()
    let barrier: Barrier = Barrier(10)
    for (i in 0..10) {
        arr.add(spawn {
            barrier.wait()
            a.fetchAdd(1)
        })
    }
    for (i in 0..10) {
        arr[i].get()
    }
    return a.load() - 10
}
