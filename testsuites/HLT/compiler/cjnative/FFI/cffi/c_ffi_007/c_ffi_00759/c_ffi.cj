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

var cStr0 = unsafe { LibC.mallocCString("CANG") }

interface I {
    func foo(): CString {
        return cStr0
    }
}

foreign func testfunc(): CPointer<CString>

extend<T> CPointer<T> <: I {
    public func foo(): CString {
        return cStr0
    }
}

unsafe main(): Int64 {
    var count = 0

    var p1: CPointer<CString> = testfunc()
    var cStr1 = unsafe { LibC.mallocCString("cang") }
    var cStr2 = unsafe { LibC.mallocCString("jie") }
    var cStr3 = unsafe { LibC.mallocCString("CANG") }
    if (cStr0.isNull() || cStr1.isNull() || cStr2.isNull() || cStr3.isNull() || p1.isNull()) {
        return 2
    }
    if ((p1.read(0).equals(cStr1)) && (p1.read(1).equals(cStr2))) {
        count += 1
    }

    if (p1.foo().equals(cStr3)) {
        count += 1
    }

    LibC.free(cStr0)
    LibC.free(cStr1)
    LibC.free(cStr2)
    LibC.free(cStr3)

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
