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

@C
struct teststruct {
    public var i8: Int8 = 0
    public var ui8: UInt8 = 0
    public var str: CString = unsafe { LibC.mallocCString("") }
}

foreign func testfunc1(): teststruct

foreign func testfunc2(st: teststruct): Int8

foreign func free(cp: CString): Unit

var count = 0

unsafe main(): Int64 {
    var a: CString = unsafe { LibC.mallocCString("abc") }
    var struct1 = testfunc1()
    if ((struct1.i8 == 123) && (struct1.ui8 == 123) && struct1.str.equals(a)) {
        count += 1
        LibC.free(struct1.str)
    }

    struct1.i8 = -128
    struct1.ui8 = 255
    var cstr = unsafe { LibC.mallocCString("efg") }
    struct1.str = cstr

    if (testfunc2(struct1) == 0) {
        count += 1
    }

    LibC.free(a)
    LibC.free(struct1.str)

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
