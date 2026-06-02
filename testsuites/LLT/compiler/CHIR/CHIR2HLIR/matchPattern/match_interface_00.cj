// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output

interface Foo {
    func foo(): Int64
}

class Foo0 <: Foo {
    public func foo() {
        0
    }
}

class Foo1 <: Foo {
    public func foo() {
        1
    }
}

main() {
    let f: Foo = match (0) {
        case 0 => Foo0()
        case _ => Foo1()
    }
    f.foo()
}
