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

foreign func testfunc(cb: CFunc<(Float64, Float64) -> Unit>): Unit

var pass = 0

@C
func add_f64(a: Float64, b: Float64): Unit {
    var c: Float64 = a + b
    print("c: " + c.toString())
    if (c == 100001.000000) {
        pass += 1
    }
}

unsafe main(): Int64 {
    testfunc(add_f64)

    if (pass == 1) {
        return 0
    } else {
        return 1
    }
}
