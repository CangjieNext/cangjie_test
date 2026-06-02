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

import std.sort.*

open class A {
    A(var ra!: Int64 = 0, let rb!: Int64 = 0) {
    }
}

class B <: A {
    B(var rc!: Int64 = 0, let rd!: Int64 = 0) {
    }
}

var a1: Array<A> = [B(rc: 0, rd: 0), A(ra: 1, rb: 2)]

main(): Int64 {
    a1.sortBy(stable: true) {a, b => b.ra.compare(a.ra)}

    if (a1[0].ra == 1 && a1[0].rb == 2 && a1[1].ra == 0 && a1[1].rb == 0) {
        return 0
    }

    return 1
}
