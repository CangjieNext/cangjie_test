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

foreign func testfunc(): CPointer<Bool>

foreign func free(cp: CPointer<Bool>): Unit

var count = 0

unsafe main(): Int64 {
    var ptr: CPointer<Bool> = testfunc()
    var ptrtmp: CPointer<Bool> = ptr + 1
    if (ptr.isNull()) {
        return 2
    }
    if ((ptr.read(0) == true) && (ptr.read(1) == false) && (ptr.read(2) == true)) {
        count += 1
    }

    if ((ptrtmp.read(-1) == true) && (ptrtmp.read() == false) && ((ptrtmp + 1).read() == true)) {
        count += 1
    }

    free(ptr)
    ptr = CPointer<Bool>()

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
