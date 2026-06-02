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

foreign func testfunc(): CPointer<Int8>

foreign func free(cp: CPointer<Int8>): Unit

unsafe main(): Int64 {
    var ptr: CPointer<Int8> = testfunc()
    if (ptr.isNull()) {
        return 2
    }
    var ptrtmp: CPointer<Int8> = ptr + 1

    if ((ptrtmp - 1).read() != -128) {
        return 1
    }

    if (ptrtmp.read() != 0) {
        return 2
    }

    if ((ptrtmp + 1).read() != 127) {
        return 3
    }

    free(ptr)
    ptr = CPointer<Int8>()

    return 0
}
