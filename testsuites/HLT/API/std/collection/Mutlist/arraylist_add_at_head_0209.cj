/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main() {
    var a: ArrayList<A> = ArrayList<A>([A(300), A(500)])
    a.add(A(200), at: 0)
    if (a.toString() != "[200, 300, 500]") {
        return 1
    }
    return 0
}

class A <: ToString {
    public A(let a: Int64) {}

    public func toString(): String {
        return "${a}"
    }
}
