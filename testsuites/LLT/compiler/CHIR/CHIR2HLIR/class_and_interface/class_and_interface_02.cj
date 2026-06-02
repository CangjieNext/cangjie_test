// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I0 {}

interface I1 <: I0 {
    func fun(): Int64
    func foo() {
        15
    }
}

open class A <: I1 {
    public var id_B = 20
    public func fun(): Int64 {
        id_B
    }
}

main() {
    var ins = A()
    var res = ins.fun() + ins.foo()
    return res - 35
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
