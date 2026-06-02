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

foreign func testfunc(): CString

foreign func printf(fmt: CString): Int32

main(): Int64 {
    var str: CString
    unsafe { str = testfunc() }
    if (str.isNull()) {
        return 2
    }
    var s = unsafe { LibC.mallocCString("Hello World\n") }
    if (str.equals(s)) {
        unsafe { LibC.free(s) }
        return 0
    } else {
        return 1
    }
}
