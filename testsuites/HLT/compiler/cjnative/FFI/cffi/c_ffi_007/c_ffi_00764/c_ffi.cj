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

foreign func testfunc(): CPointer<CString>

unsafe func foo<T>(pstr: CPointer<CString>): CPointer<CString> {
    pstr.write(0, unsafe { LibC.mallocCString("abc") })
    return pstr
}

unsafe main(): Int64 {
    var p1 = testfunc()
    var cStr = unsafe { LibC.mallocCString("abc") }
    if (cStr.isNull() || p1.isNull()) {
        return 2
    }
    var res = foo<CPointer<CString>>(p1)

    if (res.read().equals(cStr)) {
        LibC.free(cStr)
        return 0
    } else {
        return 1
    }
}
