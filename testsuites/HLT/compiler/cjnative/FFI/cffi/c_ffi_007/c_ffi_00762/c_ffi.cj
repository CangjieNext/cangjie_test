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

foreign func testfunc(): CPointer<CString>

unsafe main(): Int64 {
    var count = 0
    var pstr = testfunc()
    var cstr = unsafe { LibC.mallocCString("cang") }
    if (cstr.isNull() || pstr.isNull()) {
        return 2
    }
    func test(): () -> CPointer<CString> {
        match {
            case _ => {=> return CPointer<CString>()}
        }
    }

    var cptr1: CFunc<() -> CPointer<CString>> = {=> CPointer<CString>()}

    LibC.free(cstr)

    return 0
}
