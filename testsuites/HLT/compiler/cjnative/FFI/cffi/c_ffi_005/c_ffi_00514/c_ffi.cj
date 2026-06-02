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
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World testfunc1\n
// ASSERT: scan Hello World testfunc2\n

foreign {
    func testfunc1(): Unit

    func testfunc2(): Unit
}

main(): Int64 {
    unsafe { testfunc1() }
    unsafe { testfunc2() }
    return 0
}
