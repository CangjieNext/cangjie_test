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

foreign func testfunc(): CPointer<Int16>

foreign func free(cp: CPointer<Int16>): Unit

unsafe main(): Int64 {
    var ptr: CPointer<Int16> = testfunc()
    if (ptr.isNull()) {
        return 1
    }

    free(ptr)
    ptr = CPointer<Int16>()
    return 0
}
