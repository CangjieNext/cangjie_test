/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (CJNATIVE)EXEC: %compiler %cmp_opt %f -o %output
// (CJNATIVE and not OHOS and not Android)RUN-EXEC: %export cjHeapSize=4MB && %run %run_opt %output %run_args 2>&1 | compare %f
// (CJNATIVE and (OHOS or Android))RUN-EXEC: %export cjHeapSize=64MB && %run %run_opt %output %run_args 2>&1 | compare %f
// (CJNATIVE)ASSERT: scan Out of memory

import std.collection.*
import std.sync.*
import std.time.*
import std.runtime.*

var num = AtomicInt64(0)

class A {
    let x1 = 42
    let x2 = 42
    let x3 = 42
    let x4 = 42
    let x5 = 42
}

main(): Int64 {
    var res = ArrayList<Future<Unit>>()

    for (i in 0..1000) {
        res.add(spawn {
            var list = ArrayList<A>()
            try {
                while (true) {
                    list.add(A())
                }
            } catch (_: OutOfMemoryError) {
                list.clear()
                GC()
                num.fetchAdd(1)
                println("Out of memory")
            }
        })
    }

    for (i in 0..1000) {
        res[i].get()
    }

    let val = num.load()
    println(val)
    return 1
}
