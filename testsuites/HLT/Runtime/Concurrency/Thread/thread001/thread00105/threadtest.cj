/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// (not CJNATIVE) RUN-EXEC: export JETVMPROP=-Djet.cj.use.fibers && %run %run_opt %output %run_args

import std.sync.*
import std.collection.*

var num: AtomicInt32 = AtomicInt32(0)

func add(): Unit {
    num.fetchAdd(1)
}

main(): Int64 {
    let times: Int32 = 10
    let futList: ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()
    for (i in 0..times) {
        let fut: Future<Unit> = spawn {add()}
        futList.add(fut)
    }
    for (i in futList) {
        i.get()
    }
    if (num.load() != times) {
        return 1
    }
    return 0
}
