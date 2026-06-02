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
    func foo(m: Float32, n: Float64) {
        return m + Float32(n)
    }
}

@C
struct teststruct {
    public var f32: Float32
    public var f64: Float64

    public init(f32: Float32, f64: Float64) {
        this.f32 = f32
        this.f64 = f64
    }
}

extend<T> CPointer<T> <: I {
    public func foo(m: Float32, n: Float64) {
        return m + Float32(n)
    }
}

foreign {
    func AllocCStruct(): CPointer<teststruct>

    func testfunc(): CPointer<teststruct>
}

foreign func free(cp: CPointer<teststruct>): Unit

unsafe main(): Int64 {
    var count = 0

    var ptr1 = AllocCStruct()
    var ptr2 = testfunc()
    if (ptr1.isNull() || ptr2.isNull()) {
        return 2
    }

    if ((ptr1.read().f32 == 1.0) && (ptr1.foo(ptr1.read().f32, 1.0) == 2.0)) {
        count += 1
    }

    free(ptr1)
    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
