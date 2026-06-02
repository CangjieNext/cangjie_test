// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// Test for call member function & modify member variable inside member func.
open class A {
    public var id = 5
}

class B <: A {
    public var age = 15
    public func zoo() {
        1
    }
    public func foo() {
        var num = this.age + super.id + this.zoo()
        num
    }
}

main() {
    var ins = B()
    return ins.foo() - 21
}
