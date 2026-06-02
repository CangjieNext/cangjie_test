/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct teststruct {
    public var i8: Float32
    public var ui8: Float64
    public var mem: (Float32) -> Float64
    public var cfunc: CFunc<(Float32) -> Float64>

    public init(i8: Float32, ui8: Float64, mem: (Float32) -> Float64, cfunc: CFunc<(Float32) -> Float64>) {
        i8 = this.i8
        ui8 = this.ui8
        mem = this.mem
        cfunc = this.cfunc
    }

    public func convertCFunc2Lambda(cfunc: CFunc<(Float32) -> Float64>, mem: (Float32) -> Float64): CFunc<(Float32) -> Float64> {
        cfunc = mem
        return cfunc
    }

    public func convertLambda2CFunc(cfunc: CFunc<(Float32) -> Float64>, mem: (Float32) -> Float64): (Float32) -> Float64 {
        mem = cfunc
        return mem
    }
}

unsafe main(): Int64 {
    var cfunc1: CFunc<(Float32) -> Float64> = {
        a =>
        var b: Float32 = a + 1.0
        return Float64(b)
    }

    var mem1: (Float32) -> Float64 = {
        a =>
        var b: Float32 = a + 2.0
        return Float64(b)
    }

    var teststruct1 = teststruct(1.0, 1.0, mem1, cfunc1)
    return 0
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_used_before_initialization
// ASSERT: scan sema_mismatched_types
