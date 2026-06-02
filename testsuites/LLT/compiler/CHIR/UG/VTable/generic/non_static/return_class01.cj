// EXEC: %compiler %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan a in CB is 123456789

interface I<T> {
    func foo(): T
}

class BBB {
    public func goo() {
        return 0
    }
}

abstract class CA <: I<BBB> {
    public func foo(): BBB
}

class CB <: CA {
    var a = 123456789
    public func foo(): BBB {
        println("a in CB is ${a}")
        return BBB()
    }
}

main() {
    var x: CA = CB()
    x.foo().goo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
