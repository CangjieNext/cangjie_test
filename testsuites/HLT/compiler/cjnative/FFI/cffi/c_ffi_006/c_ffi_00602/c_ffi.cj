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

foreign func printf(fmt: CString): Int32

foreign func testfunc(fmt: CString): CString

var count = 0

main(): Int64 {
    var input: CString = unsafe { LibC.mallocCString("Hello") }
    var str: CString
    unsafe { str = testfunc(input) }
    if (str.isNull() || input.isNull()) {
        return 2
    }
    if (str.equals(unsafe { LibC.mallocCString("Hello World\n") })) {
        count += 1
    }
    unsafe { LibC.free(input) }
    unsafe { LibC.free(str) }

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
