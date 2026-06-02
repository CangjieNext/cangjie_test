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

foreign func testfunc(a: Int16): Int16

unsafe main(): Int64 {
    var i16a: Int16 = testfunc(-32768)
    var i16b: Int16 = testfunc(123)
    var i16c: Int16 = testfunc(32767)

    if ((i16a == -32768) && (i16b == 123) && (i16c == 32767)) {
        return 0
    } else {
        return 1
    }
}
