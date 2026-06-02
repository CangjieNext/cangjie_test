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

foreign func testfunc1(a: CString, b: Int32, ...): Int8

foreign func printf(fmt: CString, ...): Unit

foreign func free(cp: CPointer<Int32>): Unit

unsafe main(): Int64 {
    var cStr1 = unsafe { LibC.mallocCString("abc") }
    var cStr2 = unsafe { LibC.mallocCString("123") }
    if (cStr1.isNull() || cStr2.isNull()) {
        return 2
    }
    var cp = CPointer<Int32>()
    var res1: Int8 = testfunc1(cStr1, Int32(2), cStr1, cStr1)
    var res2: Int8 = testfunc1(cStr1, Int32(2), cStr1, cStr1)
    var res3: Int8 = testfunc1(cStr1, Int32(2), cStr1, cStr2)
    var res4: Int8 = testfunc1(cStr1, Int32(2), cStr1, cp)

    LibC.free(cStr1)
    LibC.free(cStr2)
    if ((res1 == 1) && (res2 == 1) && (res3 == 0) && (res4 == 0)) {
        return 0
    } else {
        return 1
    }
}
