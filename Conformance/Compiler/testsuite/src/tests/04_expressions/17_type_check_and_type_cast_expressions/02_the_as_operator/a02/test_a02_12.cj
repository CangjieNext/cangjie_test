/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_12

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check that (e as T2) is Some(_) when e has type T1, T1 is a class type and T2 is an interface type, and
                T1 implements T2. Check that (e as T2) is None for some cases when T1 does not implements T2.
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

class CI <: I { }
class CJ <: J { }
class CK <: K { }
class CL <: L { }

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
    let ci = CI()
    let cj = CJ()
    let ck = CK()
    let cl = CL()

    checkSome<I, I>(ci, true)
    checkSome<J, I>(cj, true)
    checkSome<K, I>(ck, true)
    checkSome<L, I>(cl, true)

    checkSome<I, J>(ci, false)
    checkSome<J, J>(cj, true)
    checkSome<K, J>(ck, true)
    checkSome<L, J>(cl, false)

    checkSome<I, K>(ci, false)
    checkSome<J, K>(cj, false)
    checkSome<K, K>(ck, true)
    checkSome<L, K>(cl, false)

    checkSome<I, L>(ci, false)
    checkSome<J, L>(cj, false)
    checkSome<K, L>(ck, false)
    checkSome<L, L>(cl, true)

    checkSome<A, I>(A(), true)
    checkSome<B, I>(B(), true)
    checkSome<C, I>(C(), true)
    checkSome<D, I>(D(), true)
    checkSome<A, I>(f(A()), true)
    checkSome<A, I>(f(B()), true)
    checkSome<A, I>(f(C()), true)
    checkSome<A, I>(f(D()), true)

    checkSome<A, J>(A(), true)
    checkSome<B, J>(B(), true)
    checkSome<C, J>(C(), true)
    checkSome<D, J>(D(), true)
    checkSome<A, J>(f(A()), true)
    checkSome<A, J>(f(B()), true)
    checkSome<A, J>(f(C()), true)
    checkSome<A, J>(f(D()), true)

    checkSome<A, K>(A(), false)
    checkSome<B, K>(B(), false)
    checkSome<C, K>(C(), false)
    checkSome<D, K>(D(), false)
    checkSome<A, K>(f(A()), false)
    checkSome<A, K>(f(B()), false)
    checkSome<A, K>(f(C()), false)
    checkSome<A, K>(f(D()), false)

    checkSome<A, L>(A(), false)
    checkSome<B, L>(B(), false)
    checkSome<C, L>(C(), false)
    checkSome<D, L>(D(), false)
    checkSome<A, L>(f(A()), false)
    checkSome<A, L>(f(B()), false)
    checkSome<A, L>(f(C()), false)
    checkSome<A, L>(f(D()), false)

    0
}
