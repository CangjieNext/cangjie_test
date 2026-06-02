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
var cstr1: CString = unsafe { LibC.mallocCString("Hello ") }
var cstr2: CString = unsafe { LibC.mallocCString("World\n") }
var cstr3: CString = unsafe { LibC.mallocCString("Hi!\n") }
var cstr4: CString = unsafe { LibC.mallocCString("Bye~\n") }

foreign func testfunc(fmt: CString): CString

unsafe main(): Int64 {
    var cstr5: CString = testfunc(cstr1)
    var cStr6 = unsafe { LibC.mallocCString("Hello World\n") }
    var cStr7 = unsafe { LibC.mallocCString("") }
    if (cstr1.isNull() || cstr2.isNull() || cstr3.isNull() || cstr4.isNull() || cstr5.isNull() || cStr6.isNull() ||
        cStr7.isNull()) {
        return 2
    }
    if (cstr5.equals(cStr6)) {
        count += 1
    }

    var arr1: Array<CString> = Array<CString>()
    arr1 = [cstr1, cstr2, cstr3, cstr4, cstr5, cStr7]

    if (arr1[0].isNull() == false) { // pointer released: no, value set to null: no
        count += 1
    }

    unsafe { LibC.free(arr1[0]) }

    if (arr1[0].isNull() == false) { // pointer released: yes, value set to null: no
        count += 1
    }

    arr1[0] = CString(CPointer<UInt8>())
    if (arr1[0].isNull() == true) { // pointer released: yes, value set to null: yes
        count += 1
    }

    if (arr1[5].isNull() == true) { // pointer released: no, value set to null: yes
        count += 1
    }

    unsafe {
        LibC.free(cstr2)
        LibC.free(cstr3)
        LibC.free(cstr4)
        LibC.free(cstr5)
        LibC.free(cStr6)
        LibC.free(cStr7)
    }

    if (count == 4) {
        return 0
    } else {
        return 1
    }
}
