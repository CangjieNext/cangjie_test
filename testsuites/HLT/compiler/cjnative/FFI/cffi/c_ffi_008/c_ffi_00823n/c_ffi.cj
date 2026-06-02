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
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

foreign let a: CPointer<Bool>

foreign func testfunc(): CPointer<Bool>

unsafe main(): Int64 {
    a = testfunc()
    if ((a.read(0) == false) && (a.read(1) == true)) {
        println("equal")
    }
    return 0
}
// ASSERT: scan sema_native_var_error
