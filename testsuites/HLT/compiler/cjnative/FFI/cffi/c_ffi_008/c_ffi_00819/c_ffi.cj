/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

foreign func testfunc(): Int8

enum A {
    | F(Int8)
    | F(Int8, Int8, Int8)
}

unsafe func f(a: Int8): Int8 {
    var p: Int8 = a + 1
    return p
}

unsafe func f(a: Int8, b: Int8, c: Int8): Int8 {
    var q: Int8 = a + b + c
    return q
}

unsafe main(): Int64 {
    var x: Int8 = testfunc()
    var m: Int8 = f(x)
    var n: Int8 = f(x, 1, 1)

    if ((m == 2) && (n == 3)) {
        return 0
    } else {
        return 1
    }
}
