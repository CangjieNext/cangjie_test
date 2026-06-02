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
    public var i8: Int8
    public var ui8: UInt8
    public var mem: (Int8) -> Int8
    public var cfunc: CFunc<(Int8) -> Int8>

    public init(i8: Int8, ui8: UInt8, mem: (Int8) -> Int8, cfunc: CFunc<(Int8) -> Int8>) {
        i8 = this.i8
        ui8 = this.ui8
        mem = this.mem
        cfunc = this.cfunc
    }

    public func convertCFunc2Lambda(cfunc: CFunc<(Int8) -> Int8>, mem: (Int8) -> Int8): CFunc<(Int8) -> Int8> {
        cfunc = mem
        return cfunc
    }

    public func convertLambda2CFunc(cfunc: CFunc<(Int8) -> Int8>, mem: (Int8) -> Int8): (Int8) -> Int8 {
        mem = cfunc
        return mem
    }
}

unsafe main(): Int64 {
    var cfunc1: CFunc<(Int8) -> Int8> = {
        a =>
        var b: Int8 = a + 1
        return b
    }

    var mem1: (Int8) -> Int8 = {
        a =>
        var b: Int8 = a + 1
        return b
    }

    var teststruct1 = teststruct(1, 1, mem1, cfunc1)
    return 0
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_used_before_initialization
// ASSERT: scan sema_mismatched_types
