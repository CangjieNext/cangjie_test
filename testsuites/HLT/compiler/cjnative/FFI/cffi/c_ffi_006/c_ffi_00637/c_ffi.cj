/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: ../%n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var count = 0

foreign func testfunc(fmt: CString): CString

unsafe main(): Int64 {
    var cstr = unsafe { LibC.mallocCString("Hello ") }
    var cstr1 = testfunc(cstr)
    var cstr2 = unsafe { LibC.mallocCString("Hello World\n") }
    var cstr3 = unsafe { LibC.mallocCString("") }
    var cstr4 = unsafe { LibC.mallocCString("123") }
    var cstr5 = unsafe { LibC.mallocCString("124") }
    var cstr6 = CString(CPointer<UInt8>())
    var cstr7 = unsafe { LibC.mallocCString("abc") }
    var cstr8 = unsafe { LibC.mallocCString("!!!") }

    if (cstr.isNull() || cstr1.isNull() || cstr2.isNull() || cstr3.isNull() || cstr4.isNull() || cstr5.isNull() ||
        cstr7.isNull() || cstr8.isNull()) {
        return 2
    }

    if ((cstr1.compare(cstr2) == 0) && (cstr2.compare(cstr1) == 0)) {
        count += 1
    }

    if ((cstr2.compare(cstr3) > 0) && (cstr3.compare(cstr2) < 0)) {
        count += 1
    }

    if ((cstr4.compare(cstr5) < 0) && (cstr5.compare(cstr4) > 0)) {
        count += 1
    }

    try {
        cstr3.compare(cstr6)
    } catch (e: Exception) {
        count += 1
    }

    try {
        cstr6.compare(cstr3)
    } catch (e: Exception) {
        count += 1
    }

    if ((cstr4.compare(cstr7) < 0) && (cstr7.compare(cstr4) > 0)) {
        count += 1
    }

    if ((cstr7.compare(cstr8) > 0) && (cstr8.compare(cstr7) < 0)) {
        count += 1
    }

    unsafe { LibC.free(cstr) }
    unsafe { LibC.free(cstr1) }
    unsafe { LibC.free(cstr2) }
    unsafe { LibC.free(cstr3) }
    unsafe { LibC.free(cstr4) }
    unsafe { LibC.free(cstr5) }
    unsafe { LibC.free(cstr6) }
    unsafe { LibC.free(cstr7) }
    unsafe { LibC.free(cstr8) }

    if (count == 7) {
        return 0
    } else {
        return 1
    }
}
