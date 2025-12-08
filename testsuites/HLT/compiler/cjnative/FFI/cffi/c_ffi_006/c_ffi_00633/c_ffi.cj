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

foreign func testfunc(fmt: CString): CString

unsafe main(): Int64 {
    var cStr1 = unsafe { LibC.mallocCString("Hello ") }
    var str = testfunc(cStr1)
    if (cStr1.isNull() || str.isNull()) {
        return 2
    }
    unsafe { LibC.free(cStr1) }
    if (str.isEmpty() == false) {
        count += 1
    }

    if (str.isNull() == false) {
        count += 1
    }
    // It is not guaranteed that false is returned when the value is not null.
    if (str.isEmpty() == false) {
        count += 1
    } else {
        count += 1
    }

    if (str.isNull() == false) {
        count += 1
    }
    unsafe { LibC.free(str) }
    if (count == 4) {
        return 0
    } else {
        return 1
    }
}
