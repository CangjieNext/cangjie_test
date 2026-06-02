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

var cstr: CFunc<(CString, CString) -> CString> = {
    a, b => if (a.equals(b)) {
        return a
    } else {
        return b
    }
}

foreign func get_cstr(cb: CFunc<(CString, CString) -> CString>): CString

foreign func printf(fmt: CString): Int32

unsafe main(): Int64 {
    var res: CString = get_cstr(cstr)
    var cstr0 = unsafe { LibC.mallocCString("World") }

    if (res.equals(cstr0)) {
        LibC.free(cstr0)
        return 0
    } else {
        return 1
    }
}
