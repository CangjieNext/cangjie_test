/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

class A {}

main(): Int64 {
    var a: Int64 = 10
    func x(input: Int64): A {
        A()
    }
    a--
    a++
    var b: ArrayList<A> = ArrayList<A>(a, x)

    a--
    a++
    b.add(A())

    return 0
}
