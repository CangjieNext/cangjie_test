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

foreign func printf(fmt: CString): Int32

foreign func testfunc(fmt: CString): CString

foreign func fflushOut(): Unit

var count = 0

main(): Int64 {
    var a: CString = unsafe { LibC.mallocCString("Hello ") }
    var b: CString = unsafe { LibC.mallocCString("World\n") }
    var str: CString
    unsafe { str = testfunc(a) }
    var substr1 = str.subCString(0, 12)
    var substr2 = str.subCString(6, 5)
    var s = unsafe { LibC.mallocCString("Hello World\n") }
    var s1 = unsafe { LibC.mallocCString("World") }
    if (a.isNull() || b.isNull() || str.isNull() || s.isNull() || s1.isNull()) {
        return 2
    }
    if (str.equals(s)) {
        count += 1
    }

    if (substr1.equals(s)) {
        count += 1
    }

    if (substr2.equals(s1)) {
        count += 1
    }
    unsafe { LibC.free(s) }
    unsafe { LibC.free(s1) }
    unsafe { fflushOut() }
    unsafe { LibC.free(str) }
    str = CString(CPointer<UInt8>())
    unsafe { LibC.free(substr1) }
    substr1 = CString(CPointer<UInt8>())
    unsafe { LibC.free(substr2) }
    substr2 = CString(CPointer<UInt8>())
    if (substr1.isNull()) {
        count += 1
    }

    unsafe { LibC.free(a) }
    unsafe { LibC.free(b) }

    if (count == 4) {
        return 0
    } else {
        return 1
    }
}
