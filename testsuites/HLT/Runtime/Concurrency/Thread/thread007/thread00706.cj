/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan num = 99990000

import std.collection.*
import std.sync.*

var num = AtomicInt64(0)

main() {
    let tlv1 = ThreadLocal<Int64>()
    var res = ArrayList<Future<Unit>>()

    for (i in 0..10000) {
        res.add(spawn {
            tlv1.set(i + i)
            num.fetchAdd(tlv1.get().getOrThrow())
        })
    }

    for (i in 0..10000) {
        res[i].get()
    }

    let val = num.load()
    println("num = ${val}")
    return 0
}
