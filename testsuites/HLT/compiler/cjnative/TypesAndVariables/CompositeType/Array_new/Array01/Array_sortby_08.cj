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

class A {
    var a: Int64
    public init(a: Int64) {
        this.a = a
    }
}

var a1: Array<A> = [A(1), A(2)]

main(): Int64 {
    a1.sortBy(stable: true) {a, b => b.a.compare(a.a)}

    if (a1[0].a != 2 || a1[1].a != 1) {
        return 1
    }

    return 0
}
