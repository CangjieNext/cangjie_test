// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface I3 {}

interface I1 <: I2 & I3 {}

interface I2 <: I4 {}

interface I4 <: I3 {}

class C1 <: I1 {}

func f(x: I4) {
    1
}

func f(x: I3) {
    2
}

open class A {}

open class B <: A {}

class C <: B {}

func foo(b: B): Int64 {
    10
}

func f1(a: B): B {
    B()
}

func foo(a: (C) -> A) {
    10000
}

func foo(a: (A) -> A) {
    20000
}

func foo(a: (C) -> C) {
    30000
}

open class C2 {}

open class C3 <: C2 {}

class C4 <: C3 {}

func f(a: C2, b: C3, c: C2) {
    100
}

func f(a: C4, b: C4, c: C3) {
    200
}

func f(a: C4, b: C3, c: C2) {
    300
}

func g(a: (C2, C2)) {
    1
}

func g(a: (C2, C3)) {
    2
}

func g(a: (C3, C2)) {
    3
}

func g(a: ((C2, C2), (C2, C2))) {
    4
}

func g(a: (C2, (C2, (C2, C2)))) {
    5
}

open class Father {
    public func foo(x: Float64) {
        1000
    }
}

class Child <: Father {
    public func foo(x: Int64) {
        2000
    }
}

func codegenUnitTest(): Int64 {
    var obj = C1()
    var res1 = f(obj) // 1

    func foo(a: A): Int64 {
        20
    }
    var res2 = foo(B()) // 20

    var res3 = f(C4(), C4(), C4()) // 200

    var myObj1: Father = Child()
    var res4 = myObj1.foo(1.2) // in Father, 1000

    var res5 = foo(f1) // 10000

    var res6 = g((C2(), C4())) // 2
    var res7 = g((C4(), C2())) // 3
    var res8 = g(((C4(), C2()), (C2(), C3()))) // 4
    var res9 = g((C4(), (C2(), (C2(), C3())))) // 5

    return res1 + res2 + res3 + res4 + res5 + res6 + res7 + res8 + res9
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 11235) {
        return 0
    } else {
        return -1
    }
}
