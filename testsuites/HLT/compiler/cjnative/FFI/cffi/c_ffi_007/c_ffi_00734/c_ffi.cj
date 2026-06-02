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
    if (ptr.isNull()) {
        return 2
    }
    var ptrtmp: CPointer<UInt16> = CPointer<UInt16>(ptr)
    if (ptrtmp.isNull()) {
        return 3
    }

    if ((ptr.read(0) == 97) && (ptr.read(1) == 98) && (ptr.read(2) == 99)) {
        count += 1
    }

    if ((ptrtmp.read(0) == 97) && (ptrtmp.read(1) == 98) && (ptrtmp.read(2) == 99)) {
        count += 1
    }

    free(ptr)

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
