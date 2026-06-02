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

foreign func testfunc(): CPointer<Float64>

foreign func free(cp: CPointer<Float64>): Unit

var count = 0

unsafe main(): Int64 {
    var ptr: CPointer<Float64> = testfunc()
    var ptrtmp: CPointer<Float64> = ptr + 1
    if (ptr.isNull()) {
        return 2
    }
    if ((ptr.read(0) == 3.1415926) && (ptr.read(1) == 0.0) && (ptr.read(2) == -3.1415926)) {
        count += 1
    }

    if ((ptrtmp.read(-1) == 3.1415926) && (ptrtmp.read() == 0.0) && ((ptrtmp + 1).read() == -3.1415926)) {
        count += 1
    }

    free(ptr)
    ptr = CPointer<Float64>()

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
