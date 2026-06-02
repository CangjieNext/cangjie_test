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

interface I {
    func foo(l: Float32, r: Float32): Float32 {
        return l + 3.14 + r
    }
}

foreign {
    func testfunc(): CPointer<Float32>

    func free(cp: CPointer<Float32>): Unit
}

extend<T> CPointer<T> <: I {
    public func foo(l: Float32, r: Float32): Float32 {
        return l + 3.14 + r
    }
}

unsafe main(): Int64 {
    var count = 0

    var p1: CPointer<Float32> = testfunc()
    if (p1.isNull()) {
        return 2
    }
    if ((p1.read(0) - 3.14 < 1e-6) && (p1.read(2) + 3.14 == Float32(0))) {
        count += 1
    }

    if (p1.foo(p1.read(0), p1.read(2)) - 3.14 < 1e-6) {
        count += 1
    }

    free(p1)
    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
