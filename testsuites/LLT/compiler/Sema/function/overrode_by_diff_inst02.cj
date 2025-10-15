// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan func in I1

open class A0 {}
class B0 <: A0 {}

interface I1<T> {
    func func1(t: T) {
        println("func in I1")
    }
}

class A {}
extend A <: I1<A0> & I1<B0> {
    public func func1(t: B0): Unit {
        println("func in A")
    }
}

main() {
    let a = A()
    let a0 = A0()
    a.func1(a0)
    0
}
