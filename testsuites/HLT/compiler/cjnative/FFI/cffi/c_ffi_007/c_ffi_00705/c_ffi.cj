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

var count = 0

unsafe main(): Int64 {
    var ptr: CPointer<Int16> = testfunc()
    var ptrtmp: CPointer<Int16> = ptr + 1

    if (ptr.isNull()) {
        return 2
    }

    if ((ptr.read(0) == -32768) && (ptr.read(1) == 0) && (ptr.read(2) == 32767)) {
        count += 1
    }

    if ((ptrtmp.read(-1) == -32768) && (ptrtmp.read() == 0) && ((ptrtmp + 1).read() == 32767)) {
        count += 1
    }

    free(ptr)
    ptr = CPointer<Int16>()

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
