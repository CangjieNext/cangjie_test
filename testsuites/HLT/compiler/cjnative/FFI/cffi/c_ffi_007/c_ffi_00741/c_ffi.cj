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

@C
struct teststruct {
    public var f32: Float32
    public var f64: Float64

    public init(f32: Float32, f64: Float64) {
        this.f32 = f32
        this.f64 = f64
    }
}

open class A {
    public var ptsA: CPointer<teststruct>

    public init(x: CPointer<teststruct>) {
        this.ptsA = x
    }

    public func foo(l: Float32, r: Float32): Float32 {
        return unsafe { l + ptsA.read().f32 + r }
    }
}

class B <: A {
    public var ptsB: CPointer<teststruct>

    public init(x: CPointer<teststruct>) {
        super(x)
        this.ptsB = x
    }

    public func foo(l: Float64, r: Float64): Float64 {
        return unsafe { l + ptsB.read().f64 + r }
    }
}

foreign {
    func AllocCStruct(): CPointer<teststruct>

    func testfunc(): CPointer<teststruct>
}

foreign func free(cp: CPointer<teststruct>): Unit

unsafe main(): Int64 {
    var count = 0
    var ptr = AllocCStruct()
    if (ptr.isNull()) {
        return 2
    }
    var a1 = A(ptr)
    var b1 = B(testfunc())

    if ((a1.ptsA.read(0).f32 == b1.ptsB.read().f32) && (a1.ptsA.read(0).f64 == b1.ptsB.read().f64)) {
        count += 1
    }

    if ((a1.foo(1.0, 1.0) == 3.0) && (b1.foo(Float64(2), Float64(2)) == Float64(5))) {
        count += 1
    }

    free(ptr)
    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
