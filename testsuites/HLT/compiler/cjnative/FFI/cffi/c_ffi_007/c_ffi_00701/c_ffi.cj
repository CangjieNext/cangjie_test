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

foreign func testfunc(): CPointer<Unit>

foreign func free(cp: CPointer<Unit>): Unit

unsafe main(): Int64 {
    var ptr: CPointer<Unit> = testfunc()

    if (!ptr.isNotNull()) {
        return 1
    }

    if (ptr.isNull()) {
        return 2
    }

    if (ptr.read() != ()) {
        return 3
    }
    free(ptr)
    ptr = CPointer<Unit>()
    return 0
}
