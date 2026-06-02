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

foreign func testfunc1(num_arg: Int32, ...): Int32

foreign func testfunc2(num_arg1: Int32, num_arg2: Int32, ...): Int32

foreign func printf(fmt: CString, ...): Unit

unsafe main(): Int64 {
    var res1: Int32 = testfunc1(1, 1)
    var res2: Int32 = testfunc2(2, 1, Int32(2))
    var res3: Int32 = testfunc2(3, 2, Int32(2), Int32(3))
    var res4: Int32 = testfunc2(4, 3, Int32(2), Int32(3), Int32(4))
    var res5: Int32 = testfunc1(5, Int32(1), Int32(2), Int32(3), Int32(4), Int32(5))

    if ((res1 == 1) && (res2 == 4) && (res3 == 8) && (res4 == 13) && (res5 == 15)) {
        return 0
    } else {
        return 1
    }
}
