// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan func in I2

class A0 {}
class B0 {}

interface I1<T1> {
    func func1(t: T1) {
        println("func in I1")
    }
}

interface I2<T2> <: I1<T2> {
    func func1(t: T2): Unit {
        println("func in I2")
    }
}

class A <: I1<A0> & I2<B0> {}

main() {
    let a = A()
    let a0 = B0()
    a.func1(a0)
    0
}
