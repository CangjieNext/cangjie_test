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

foreign func testfunc(): CPointer<CString>

unsafe func foo<T>(pstr: CPointer<CString>): CPointer<CString> {
    pstr.write(0, unsafe { LibC.mallocCString("abc") })
    return pstr
}

unsafe main(): Int64 {
    var p1 = testfunc()
    var res = foo<CPointer<CString>>(p1)

    if (res == unsafe { LibC.mallocCString("cang") }) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_invalid_binary_expr
