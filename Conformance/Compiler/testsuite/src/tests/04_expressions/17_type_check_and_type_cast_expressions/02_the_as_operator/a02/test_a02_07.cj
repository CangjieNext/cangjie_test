/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_07

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check that (e as T2) is Some(T2) when e has type T1, T1 and T2 are Tuple types, and the type of each
                element in T1 is the subtype of the type of the corresponding element in T2.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert


interface I {}
interface J <: I {}
interface K <: J {}
interface L <: I {}

open class A <: J {}
open class B <: A {}
class C <: B {}
class D <: A {}

func j() : J { A() }

let t = (B(), j(), 1)

func isSome<T>(expected : Bool) {
    let o = t as T
    var val = match (o) {
        case None => Assert.isFalse(expected)
        case Some(_) => Assert.isTrue(expected)
    }
}

main() {
    isSome<(B, J, Int64)>(true)
    Assert.equals(t[2], (t as (B, J, Int64)).getOrThrow()[2])
    isSome<(A, J, Int64)>(true)
    Assert.equals(t[2], (t as (A, J, Int64)).getOrThrow()[2])
    isSome<(B, I, Int64)>(true)
    Assert.equals(t[2], (t as (B, I, Int64)).getOrThrow()[2])
    isSome<(A, I, Int64)>(true)
    Assert.equals(t[2], (t as (A, I, Int64)).getOrThrow()[2])
    isSome<(C, J, Int64)>(false)
    isSome<(D, J, Int64)>(false)
    isSome<(D, K, Int64)>(false)
    isSome<(B, L, Int64)>(false)
    isSome<(B, L, Int32)>(false)
    isSome<(B, L, Int64)>(false)
    isSome<(B, A, Int64)>(true)

    0
}
