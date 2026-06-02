/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan -56
// will not exception.

@OverflowThrowing
foreign func testfunc(a: Int8, b: Int8): Int8

unsafe main(): Int64 {
    var res = testfunc(100, 100)
    print("${res}\n")
    return 0
}
