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

foreign func testfunc(input: CPointer<Int8>): CPointer<Int8>

foreign func free(cp: CPointer<Int8>): Unit

unsafe main(): Int64 {
    var input: CPointer<Int8> = CPointer<Int8>()
    var ptr: CPointer<Int8> = testfunc(input)
    if (ptr.isNull()) {
        return 2
    }
    if ((ptr.read(0) == 127) && (ptr.read(1) == 0) && (ptr.read(2) == -128)) {
        free(ptr)
        ptr = CPointer<Int8>()
        return 0
    } else {
        free(ptr)
        ptr = CPointer<Int8>()
        return 1
    }
}
