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

foreign func testfunc(): CPointer<UInt32>

foreign func free(cp: CPointer<UInt32>): Unit

unsafe main(): Int64 {
    var ptr: CPointer<UInt32> = testfunc()
    if (ptr.isNull()) {
        return 2
    }
    ptr.write(UInt32(r'd'))

    if (ptr.read() == UInt32(r'd')) {
        free(ptr)
        ptr = CPointer<UInt32>()
        return 0
    } else {
        free(ptr)
        ptr = CPointer<UInt32>()
        return 1
    }
}
