// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

open class A {
    public var id = 5
}

class B <: A {
    public var a = 8
    public init(a_: Int64) {
        a = a_
    }
}

main() {
    var insA = A()
    var insB = B(9)
    return insA.id + insB.a - 14
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
