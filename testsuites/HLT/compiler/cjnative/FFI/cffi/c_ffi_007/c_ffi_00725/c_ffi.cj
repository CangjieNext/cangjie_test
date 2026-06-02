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

var count = 0

unsafe main(): Int64 {
    var ptr: CPointer<UInt32> = testfunc()
    if (ptr.isNull()) {
        return 2
    }
    var ptrtmp: CPointer<UInt32> = ptr + 1

    if ((ptr.read(0) == UInt32(r'a')) && (ptr.read(1) == UInt32(r'b')) && (ptr.read(2) == UInt32(r'c'))) {
        count += 1
    }

    if ((ptrtmp.read(-1) == UInt32(r'a')) && (ptrtmp.read() == UInt32(r'b')) && ((ptrtmp + 1).read() == UInt32(r'c'))) {
        count += 1
    }

    free(ptr)
    ptr = CPointer<UInt32>()

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
