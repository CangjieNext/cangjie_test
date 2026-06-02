/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_10

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check that (e as T2) is Some(_) when e has type T1, T1 and T2 are interface types, and T1 inherits T2
                (including transitively). Check that (e as T2) is None for some cases when T1 does not inherit T2.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert


interface I {}
interface J <: I {}
interface K <: J {}
interface L <: I {}

class CI <: I {
  var i : Int64 = 0
  init(x : Int64) { i = x }
  static func asInterface() : I { CI(1) }
}

class CJ <: J {
  var j : Int64 = 0
  init(x : Int64) { j = x }
  static func asInterface() : J { CJ(2) }
}

class CK <: K {
  var k : Int64 = 0
  init(x : Int64) { k = x }
  static func asInterface() : K { CK(3) }
}

class CL <: L {
  var l : Int64 = 0
  init(x : Int64) { l = x }
  static func asInterface() : L { CL(4) }
}

func checkSome<T1, T2>(t : T1, expected : Bool) {
    let o = t as T2
    var val = match (o) {
        case None => Assert.isFalse(expected)
        case Some(_) => Assert.isTrue(expected)
    }
}

main() {
    let ci = CI.asInterface()
    let cj = CJ.asInterface()
    let ck = CK.asInterface()
    let cl = CL.asInterface()

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

    0
}
