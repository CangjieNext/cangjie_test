struct A <: I1 {
    let a = 4
}
class B {
    var b = 3
    func m(a: Int32) {b-Int64(a)-1}
}


interface I1 {}
interface I2 {}
interface I3<T,U> <: I2 {}

func u1() {
    let a = A()
    let b: I1 = a // box A to I1
    let c = (b as A).getOrThrow().a 
    c
}

func u2() {
    let a = B()
    let b: Any = a
    if ((b as B).getOrThrow().b == 3) {0} else {1}
}

func u3() {
    let a = B()
    let b: Any = a 
    let c = b as B
    if (let Some(k) <- c) {
        k.m(1)
    } else {
        0
    }
}

main() {
    println("${u1()} ${u2()} ${u3()}")
}

extend A <: I2 {}
extend B { func a(){}
    public func m(a: Int64) {b-Int64(a)}
}

// ASSERT: scan 4 0 2

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
