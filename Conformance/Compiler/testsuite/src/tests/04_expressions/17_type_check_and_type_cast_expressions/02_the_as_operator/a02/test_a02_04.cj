/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_04

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check for various non-equatable types T and expressions of these types e that when the type of e is
                T the value of (e as T) is Some(_), otherwise the value is None.
  @Mode: run
  @Negative: no
  @Structure: single
  @Issue: 6307

*/

import utils.assert.Assert

var res = 0
var counter = 0
var expected = 1

interface I {}

class C <: I {}

func asI() : I { C() } 

class C1 {
    var i : Int64 = 0
    init() {}
    init(x : Int64) { i = x }
}
class C2 {
    var i : Int64 = 0
    init() {}
    init(x : Int64) { i = x }
}

func isSome<T1, T2>(x : T1) {
    let o = x as T2
    let val = match (o) {
        case None => 0
        case Some(_) => 1
    }
    res += val << counter
    counter++
}

func check<T>(x : T) {
    counter = 0
    res = 0

    isSome<T, C1>(x)
    isSome<T, C2>(x)
    isSome<T, I>(x)
    isSome<T, () -> I>(x)
    isSome<T, Unit>(x)
    isSome<T, (Int64, Int64)>(x)
    isSome<T, Nothing>(x)

    Assert.equals(expected, res)
    expected <<= 1
}

main() {
    check(C1())
    check(C2())
    check(asI())
    check(asI)
    check(())
    check((1, 1))

    0
}
