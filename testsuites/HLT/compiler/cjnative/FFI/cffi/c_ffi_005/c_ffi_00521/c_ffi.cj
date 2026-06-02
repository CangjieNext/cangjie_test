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

foreign func testfunc(a: Int32): Int32

unsafe main(): Int64 {
    var i32a: Int32 = testfunc(-2147483648)
    var i32b: Int32 = testfunc(123)
    var i32c: Int32 = testfunc(2147483647)

    if ((i32a == -2147483648) && (i32b == 123) && (i32c == 2147483647)) {
        return 0
    } else {
        return 1
    }
}
