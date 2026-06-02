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

class A {
    public var pstr: CPointer<CString>

    public init(pstr: CPointer<CString>) {
        this.pstr = pstr
    }

    public unsafe func foo(): CString {
        pstr.write(0, unsafe { LibC.mallocCString("CANGJIE") })
        return pstr.read()
    }
}

foreign func testfunc(): CPointer<CString>

unsafe main(): Int64 {
    var count = 0

    var p1: CPointer<CString> = testfunc()
    var a1 = A(p1)
    var p2 = p1
    var tuple1 = (p1, count, p2)
    var cStr1 = unsafe { LibC.mallocCString("cang") }
    var cStr2 = unsafe { LibC.mallocCString("jie") }
    if (cStr1.isNull() || cStr2.isNull() || p1.isNull()) {
        return 2
    }
    if ((tuple1[0].read(0).equals(cStr1)) && (tuple1[2].read(1).equals(cStr2))) {
        count += 1
    }

    var cstr = a1.foo()
    tuple1[2].write(0, cstr)
    if (tuple1[2].read(0).equals(cstr)) {
        count += 1
    }
    LibC.free(cStr1)
    LibC.free(cStr2)

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
