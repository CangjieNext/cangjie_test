// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output

open class A {
    var i: Int64 = 0
    init() {}
    public init(x: Int64) {
        i = x
    }
}

open class B <: A {
    init() {
        super()
    }
    init(x: Int64) {
        super(x)
    }
}

class C <: B {
    init() {
        super()
    }
    init(x: Int64) {
        super(x)
    }
}

class D <: A {
    init() {
        super()
    }
}

let fn = {a: A, b: B => (A(1), C(2))}

func isSome<T>(expected: Bool) {
    let o = fn as T
    var val = match (o) {
        case None => false
        case Some(_) => true
    }
    if (val != expected) {
        throw Exception()
    }
}

func equals(a: Int64, b: Int64) {
    if (a != b) {
        throw Exception()
    }
}

main() {
    let res1 = fn(D(), C())
    isSome<(A, B) -> (A, C)>(true)
    let res2 = (fn as (A, B) -> (A, C)).getOrThrow()(D(), C())
    equals(res1[0].i, res2[0].i)
    equals(res1[1].i, res2[1].i)
    isSome<(A, A) -> (A, A)>(false)
    isSome<(A, A) -> (A, B)>(false)
    isSome<(A, C) -> (A, A)>(true)
    let res3 = (fn as (A, C) -> (A, A)).getOrThrow()(D(), C())
    equals(res1[0].i, res3[0].i)
    equals(res1[1].i, res3[1].i)
    isSome<(A, C) -> (A, B)>(true)
    let res4 = (fn as (A, C) -> (A, B)).getOrThrow()(D(), C())
    equals(res1[0].i, res4[0].i)
    equals(res1[1].i, res4[1].i)
    isSome<(A, B) -> (A, A)>(true)
    let res5 = (fn as (A, B) -> (A, A)).getOrThrow()(D(), C())
    equals(res1[0].i, res5[0].i)
    equals(res1[1].i, res5[1].i)
    isSome<(A, B) -> (A, B)>(true)
    let res6 = (fn as (A, B) -> (A, B)).getOrThrow()(D(), C())
    equals(res1[0].i, res6[0].i)
    equals(res1[1].i, res6[1].i)

    isSome<(D, B) -> (A, C)>(true)
    let res7 = (fn as (D, B) -> (A, C)).getOrThrow()(D(), C())
    equals(res1[0].i, res7[0].i)
    equals(res1[1].i, res7[1].i)
    isSome<(A, D) -> (A, C)>(false)
    isSome<(A, B) -> (D, C)>(false)
    isSome<(A, B) -> (A, D)>(false)

    0
}
