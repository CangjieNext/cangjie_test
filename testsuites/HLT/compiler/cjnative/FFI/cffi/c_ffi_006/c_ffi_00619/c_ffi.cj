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

foreign func testfunc(a: CString, b: CString): Unit

foreign func fflushOut(): Unit

var count = 0

main(): Int64 {
    var a: CString = unsafe { LibC.mallocCString("Hello ") }
    var b: CString = unsafe { LibC.mallocCString("World\n") }
    unsafe { testfunc(a, b) }
    if (a.isNull() || b.isNull()) {
        return 2
    }
    if (a.equals(unsafe { LibC.mallocCString("World\n") })) {
        count += 1
    }

    unsafe { LibC.free(a) }
    a = CString(CPointer<UInt8>())
    if (a.isNull()) {
        count += 1
    }

    unsafe { LibC.free(b) }
    b = CString(CPointer<UInt8>())
    if (b.isNull()) {
        count += 1
    }
    unsafe { fflushOut() }

    unsafe { LibC.free(a) }
    unsafe { LibC.free(b) }

    if (count == 3) {
        return 0
    } else {
        return 1
    }
}
