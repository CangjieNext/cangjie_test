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

var cstr: CFunc<(CString) -> CString> = {
    a => if (a.equals(unsafe { LibC.mallocCString("") })) {
        return a
    } else {
        return unsafe { LibC.mallocCString("") }
    }
}

foreign func get_cstr(): CFunc<(CString, CString) -> CString>

unsafe main(): Int64 {
    cstr = get_cstr()
    return 0
}
// ASSERT: scan sema_mismatched_types
