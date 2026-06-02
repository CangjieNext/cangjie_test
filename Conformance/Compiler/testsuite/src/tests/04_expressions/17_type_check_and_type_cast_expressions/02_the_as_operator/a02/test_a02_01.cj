/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_01

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check for various simple equatable types T and expressions of these types e that when the type of e is
                T the value of (e as T) is Some(e), otherwise the value is None.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var res = 0
var counter = 0
var expected = 2

func isSome<T1, T2>(x : T1, some : T2) where T2 <: Equatable<T2> {
    let o = x as T2
    var val = match (o) {
        case None => 0
        case Some(_) => 1
    }
    if (val == 1 && some == o.getOrThrow()) {
      val = 2
    }
    res += val << counter
    counter += 2
}

func check<T>(t : T) where T <: Equatable<T> {
    counter = 0
    res = 0

    isSome(t, 1i8)
    isSome(t, 1i16)
    isSome(t, 1i32)
    isSome(t, 1i64)
    isSome(t, 1u8)
    isSome(t, 1u16)
    isSome(t, 1u32)
    isSome(t, 1u64)
    isSome(t, 1.0f16)
    isSome(t, 1.0f32)
    isSome(t, 1.0f64)
    isSome(t, true)
    isSome(t, r'1')
    isSome(t, "1")
    isSome(t, ["1"])
    isSome(t, 1..2)

    Assert.equals(expected, res)
    expected <<= 2
}


main() {
    check(1i8)
    check(1i16)
    check(1i32)
    check(1i64)
    check(1u8)
    check(1u16)
    check(1u32)
    check(1u64)
    check(1.0f16)
    check(1.0f32)
    check(1.0f64)
    check(true)
    check(r'1')
    check("1")
    check(["1"])
    check(1..2)

    0
}
