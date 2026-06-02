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
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

foreign func testfunc1(str_arg1: CString, str_arg2: CString, ...): Int32

foreign func testfunc2(str_arg1: CString, ...): Int32

class A {
    var mem: Int32 = 0
}

unsafe main(): Int64 {
    var a: A = A()
    var res1: Int32 = testfunc1(LibC.mallocCString("abc"), LibC.mallocCString("abc"), a)
    var res2: Int32 = testfunc1(LibC.mallocCString("abc"), LibC.mallocCString("abc"), a, a)
    var res3: Int32 = testfunc1(LibC.mallocCString("abc"), a, a)
    var res4: Int32 = testfunc1(a, a, a)

    var res5: Int32 = testfunc2(LibC.mallocCString("abc"), LibC.mallocCString("abc"), a)
    var res6: Int32 = testfunc2(LibC.mallocCString("abc"), LibC.mallocCString("abc"), a, a)
    var res7: Int32 = testfunc2(LibC.mallocCString("abc"), a, a)
    var res8: Int32 = testfunc2(a, a, a)

    return 0
}
// ASSERT: scan sema_mismatched_types
