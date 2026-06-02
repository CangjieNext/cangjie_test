// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f %diag_json -o %n.%suffix 2>&1 | compare %f

interface I1 {
    func foo1() {
        return 0
    }
}

struct R1 <: I1 {
    public mut func foo1() {
        return 0
    }
}

interface I2 {
    mut func foo2() {
        return 0
    }
}

struct R2 <: I2 {
    public func foo2() {
        return 0
    }
}

interface I3 {
    func foo3(): Unit
}

struct R3 <: I3 {
    public mut func foo3(): Unit {
    }
}

interface I4 {
    mut func foo4(): Unit
}

struct R4 <: I4 {
    public func foo4(): Unit {
    }
}

main() {
    return 1
}
// ASSERT: scan sema_incompatible_mut_modifier_between_struct_and_interface
