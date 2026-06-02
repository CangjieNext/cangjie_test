// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %n.cj -o %output

interface I {
    func foo(): Int64
}

open class Parent <: I {
    public open func foo() {
        1
    }
}

class Child <: Parent {
    public override func foo() {
        2
    }
}

main() {
    let x = match (Child()) {
        case _: I => 0
        case _: Parent => 1
        case _: Child => 2
    }
    x
}
