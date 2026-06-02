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

foreign func testfunc(a: CString, b: CString, c: CString, d: CString, e: CString): Int32

foreign func fflushOut(): Unit

var count = 0

main(): Int64 {
    var arr1: Array<Rune> = Array<Rune>(100, {i => r'\0'})
    arr1[0] = r'H'
    var a = unsafe { LibC.mallocCString(String(arr1)) }
    var arr2: Array<Rune> = Array<Rune>(100, {i => r'\0'})
    arr2[0] = r'e'
    var b = unsafe { LibC.mallocCString(String(arr2)) }
    var arr3: Array<Rune> = Array<Rune>(100, {i => r'\0'})
    arr3[0] = r'l'
    var c = unsafe { LibC.mallocCString(String(arr3)) }
    var arr4: Array<Rune> = Array<Rune>(100, {i => r'\0'})
    arr4[0] = r'l'
    var d = unsafe { LibC.mallocCString(String(arr4)) }
    var arr5: Array<Rune> = Array<Rune>(100, {i => r'\0'})
    arr5[0] = r'o'
    arr5[1] = r'\n'
    var e = unsafe { LibC.mallocCString(String(arr5)) }

    unsafe {
        if (testfunc(a, b, c, d, e) == 6) {
            count += 1
        }
    }
    unsafe { LibC.free(a) }
    unsafe { LibC.free(b) }
    unsafe { LibC.free(c) }
    unsafe { LibC.free(d) }
    unsafe { LibC.free(e) }

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
