/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_11

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check that (e as T2) is Some(_) when e has type T1, T1 and T2 are class types, and T1 inherits T2
                (including transitively). Check that (e as T2) is None for some cases when T1 does not inherit T2.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

open class A {}
open class B <: A {}
class C <: B {}
class D <: A {}

func f(a : A) : A {
  return a
}

func checkSome<T1, T2>(t : T1, expected : Bool) {
    let o = t as T2
    var val = match (o) {
        case None => Assert.isFalse(expected)
        case Some(_) => Assert.isTrue(expected)
    }
}

main() {
    checkSome<A, A>(A(), true)
    checkSome<B, A>(B(), true)
    checkSome<C, A>(C(), true)
    checkSome<D, A>(D(), true)

    checkSome<A, B>(A(), false)
    checkSome<B, B>(B(), true)
    checkSome<C, B>(C(), true)
    checkSome<D, B>(D(), false)

    checkSome<A, C>(A(), false)
    checkSome<B, C>(B(), false)
    checkSome<C, C>(C(), true)
    checkSome<D, C>(D(), false)

    checkSome<A, D>(A(), false)
    checkSome<B, D>(B(), false)
    checkSome<C, D>(C(), false)
    checkSome<D, D>(D(), true)


    checkSome<A, A>(f(A()), true)
    checkSome<A, A>(f(B()), true)
    checkSome<A, A>(f(C()), true)
    checkSome<A, A>(f(D()), true)

    checkSome<A, B>(f(A()), false)
    checkSome<A, B>(f(B()), true)
    checkSome<A, B>(f(C()), true)
    checkSome<A, B>(f(D()), false)

    checkSome<A, C>(f(A()), false)
    checkSome<A, C>(f(B()), false)
    checkSome<A, C>(f(C()), true)
    checkSome<A, C>(f(D()), false)

    checkSome<A, D>(f(A()), false)
    checkSome<A, D>(f(B()), false)
    checkSome<A, D>(f(C()), false)
    checkSome<A, D>(f(D()), true)

    0
}
