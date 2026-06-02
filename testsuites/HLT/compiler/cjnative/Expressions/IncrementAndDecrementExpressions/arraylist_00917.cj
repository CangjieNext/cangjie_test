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

main(): Int64 {
    var a: Int64 = 20
    func x(input: Int64): Int64 {
        input
    }
    a--
    a++
    var b: ArrayList<Int64> = ArrayList<Int64>(a, x)

    a--
    a++
    var s_1 = b.size
    a--
    a++

    a--
    a++
    b.add(1)

    a--
    a++
    var s_2 = b.size
    a--
    a++
    s_2--
    s_2++
    s_1--
    s_1++
    if (s_1 != s_2 - 1) {
        return 1
    }
    return 0
}
