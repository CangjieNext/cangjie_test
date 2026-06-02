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

foreign func testfunc(): CPointer<CPointer<Int8>>

var count = 0

foreign func free(cp: CPointer<Int8>): Unit

unsafe main(): Int64 {
    var ptr: CPointer<CPointer<Int8>> = testfunc()
    if (ptr.isNull()) {
        return 2
    }
    if ((ptr.read().read(0) == -128) && (ptr.read().read(1) == 0) && (ptr.read().read(2) == 127)) {
        count += 1
    }

    free(ptr.read())
    free(CPointer<Int8>(ptr))
    ptr = CPointer<CPointer<Int8>>()

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
