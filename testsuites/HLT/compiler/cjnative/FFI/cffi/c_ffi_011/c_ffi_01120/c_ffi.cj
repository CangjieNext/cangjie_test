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

foreign func testfunc(cb: CFunc<(UInt64, UInt64) -> UInt64>): UInt64

@C
func add_i64(a: UInt64, b: UInt64): UInt64 {
    return a + b
}

unsafe main(): Int64 {
    if (testfunc(add_i64) == 18446744073709500000) {
        return 0
    } else {
        return 1
    }
}
