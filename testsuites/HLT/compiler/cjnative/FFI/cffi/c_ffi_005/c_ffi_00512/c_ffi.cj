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

foreign func testfunc(a: Float32, b: Float32): Float32

main(): Int64 {
    unsafe {
        if (testfunc(1.33333, 1.33333) < 1.77777 && testfunc(1.33333, 1.33333) > 1.77776) {
            return 0
        }
    }
    return 1
}
