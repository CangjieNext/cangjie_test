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
// EXEC: %compiler %cmp_opt %ffic_opt
// ASSERT: regex-not error

foreign func testfunc(): CPointer<Float32>

unsafe main(): Int64 {
    var count = 0

    var ptr: CPointer<Float32> = testfunc()

    if ((ptr.read(0) == 3.14) && (ptr.read(1) == 0.0) && (ptr.read(2) == -3.14)) {
        count += 1
    }

    ptr += 1

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
