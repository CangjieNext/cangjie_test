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

foreign func testfunc1(num_arg: UInt16, ...): UInt16

foreign func testfunc2(num_arg1: UInt16, num_arg2: UInt16, ...): UInt16

foreign func printf(fmt: CString, ...): Unit

unsafe main(): Int64 {
    var res1: UInt16 = testfunc1(1, 1)
    var res2: UInt16 = testfunc2(2, 1, UInt16(2))
    var res3: UInt16 = testfunc2(3, 2, UInt16(2), UInt16(3))
    var res4: UInt16 = testfunc2(4, 3, UInt16(2), UInt16(3), UInt16(4))
    var res5: UInt16 = testfunc1(5, UInt16(1), UInt16(2), UInt16(3), UInt16(4), UInt16(5))

    if ((res1 == 1) && (res2 == 4) && (res3 == 8) && (res4 == 13) && (res5 == 15)) {
        return 0
    } else {
        return 1
    }
}
