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
    public var age = 15
    public func foo() {
        var num = this.age + super.id
        num
    }
}

main() {
    B().foo() - 20
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
