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

foreign func testfunc1(num_arg: Int64, ...): Int64

foreign func testfunc2(num_arg1: Int64, num_arg2: Int64, ...): Int64

foreign func printf(fmt: CString, ...): Unit

unsafe main(): Int64 {
    var res1: Int64 = testfunc1(1, 1)
    var res2: Int64 = testfunc2(2, 1, Int64(2))
    var res3: Int64 = testfunc2(3, 2, Int64(2), Int64(3))
    var res4: Int64 = testfunc2(4, 3, Int64(2), Int64(3), Int64(4))
    var res5: Int64 = testfunc1(5, Int64(1), Int64(2), Int64(3), Int64(4), Int64(5))

    if ((res1 == 1) && (res2 == 4) && (res3 == 8) && (res4 == 13) && (res5 == 15)) {
        return 0
    } else {
        return 1
    }
}
