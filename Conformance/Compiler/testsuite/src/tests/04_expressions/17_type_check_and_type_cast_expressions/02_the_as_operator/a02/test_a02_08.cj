/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_08

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check that (e as T2) is Some(T2) when e has type T1, T1 and T2 are Function types, and the parameter
                type of T2 is the subtype of the parameter type of T1 and the return type of T1 is the subtype of the
                return type of T2.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

open class A {
  var i : Int64 = 0
  init() {}
  public init(x : Int64) { i = x }
}
open class B <: A {
    init() { super() }
    init(x : Int64) { super(x) }
}
class C <: B {
    init() { super() }
    init(x : Int64) { super(x) }
}
class D <: A {
    init() { super() }
}

let fn = { a : A, b : B => (A(1), C(2)) }

func isSome<T>(expected : Bool) {
    let o = fn as T
    var val = match (o) {
        case None => Assert.isFalse(expected)
        case Some(_) => Assert.isTrue(expected)
    }
}

main() {
    let res1 = fn(D(), C())
    isSome<(A, B) -> (A, C)>(true)
    let res2 = (fn as (A, B) -> (A, C)).getOrThrow()(D(), C())
    Assert.equals(res1[0].i, res2[0].i)
    Assert.equals(res1[1].i, res2[1].i)
    isSome<(A, A) -> (A, A)>(false)
    isSome<(A, A) -> (A, B)>(false)
    isSome<(A, C) -> (A, A)>(true)
    let res3 = (fn as (A, C) -> (A, A)).getOrThrow()(D(), C())
    Assert.equals(res1[0].i, res3[0].i)
    Assert.equals(res1[1].i, res3[1].i)
    isSome<(A, C) -> (A, B)>(true)
    let res4 = (fn as (A, C) -> (A, B)).getOrThrow()(D(), C())
    Assert.equals(res1[0].i, res4[0].i)
    Assert.equals(res1[1].i, res4[1].i)
    isSome<(A, B) -> (A, A)>(true)
    let res5 = (fn as (A, B) -> (A, A)).getOrThrow()(D(), C())
    Assert.equals(res1[0].i, res5[0].i)
    Assert.equals(res1[1].i, res5[1].i)
    isSome<(A, B) -> (A, B)>(true)
    let res6 = (fn as (A, B) -> (A, B)).getOrThrow()(D(), C())
    Assert.equals(res1[0].i, res6[0].i)
    Assert.equals(res1[1].i, res6[1].i)

    isSome<(D, B) -> (A, C)>(true)
    let res7 = (fn as (D, B) -> (A, C)).getOrThrow()(D(), C())
    Assert.equals(res1[0].i, res7[0].i)
    Assert.equals(res1[1].i, res7[1].i)
    isSome<(A, D) -> (A, C)>(false)
    isSome<(A, B) -> (D, C)>(false)
    isSome<(A, B) -> (A, D)>(false)

    0
}
