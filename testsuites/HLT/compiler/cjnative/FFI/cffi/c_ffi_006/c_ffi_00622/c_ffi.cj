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

main(): Int64 {
    unsafe {
        var cstr5: CString = testfunc(cstr1)
        var cStr0 = unsafe { LibC.mallocCString("Hello World\n") }
        if (cstr1.isNull() || cstr2.isNull() || cstr3.isNull() || cstr4.isNull() || cstr5.isNull() || cStr0.isNull()) {
            return 2
        }
        if (cstr5.equals(cStr0)) {
            count += 1
        }
        unsafe { LibC.free(cStr0) }

        var arr1: Array<CString> = Array<CString>()
        arr1 = [cstr1, cstr2, cstr3, cstr4, cstr5]

        var arr2: Array<CString> = arr1.toArray()
        if ((arr2[0].equals(cstr1)) && (arr2[1].equals(cstr2)) && (arr2[2].equals(cstr3)) && (arr2[3].equals(cstr4)) && (arr2[4]
            .equals(cstr5))) {
            count += 1
        }

        var arr3: Array<CString> = Array<CString>(5, repeat: cstr1)
        if ((arr3[0].equals(cstr1)) && (arr3[1].equals(cstr1)) && (arr3[2].equals(cstr1)) && (arr3[3].equals(cstr1)) && (arr3[4]
            .equals(cstr1))) {
            count += 1
        }

        unsafe { LibC.free(cstr1) }
        unsafe { LibC.free(cstr2) }
        unsafe { LibC.free(cstr3) }
        unsafe { LibC.free(cstr4) }
        unsafe { LibC.free(cstr5) }

        if (count == 3) {
            return 0
        } else {
            return 1
        }
    }
}
