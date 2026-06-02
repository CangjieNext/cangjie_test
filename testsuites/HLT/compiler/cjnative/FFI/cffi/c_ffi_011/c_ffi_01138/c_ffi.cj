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

foreign func testfunc(cb: CFunc<(UInt16, UInt16) -> Unit>): Unit

var pass = 0

@C
func printCj(a: UInt16, b: UInt16): Unit {
    var c: UInt16 = a + b
    if (c == 65535) {
        pass += 1
    }
}

unsafe main(): Int64 {
    testfunc(printCj)

    if (pass == 1) {
        return 0
    } else {
        return 1
    }
}
