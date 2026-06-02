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

var count = 0

foreign func testfunc(): CString

unsafe main(): Int64 {
    var str = testfunc()
    if (str.isEmpty() == false) {
        count += 1
        println("pass1")
    }

    if (str.isNull() == false) {
        count += 1
        println("pass2")
    }

    str = CString(CPointer<UInt8>())

    if (str.isEmpty() == true) {
        count += 1
        println("pass3")
    }

    if (str.isNull() == true) {
        count += 1
        println("pass4")
    }

    unsafe { LibC.free(str) }

    if (count == 4) {
        return 0
    } else {
        return 1
    }
}
