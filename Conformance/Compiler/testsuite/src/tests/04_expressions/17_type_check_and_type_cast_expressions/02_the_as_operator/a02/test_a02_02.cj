/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_02

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check for various simple equatable types T and expressions e1, e2 of Type T that e1 as T != Some(e2)
                when e1 != e2
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

func check<T>(x : T, y : T) where T <: Equatable<T> {
    let o = x as T
    var none : Bool = false
    var val = match (o) {
        case None => none = true
        case Some(some) => Assert.notEquals(y, some)
    }
    Assert.isFalse(none)
}

main() {
    check(1i8, 2i8)
    check(1i16, 2i16)
    check(1i32, 2i32)
    check(1i64, 2i64)
    check(1u8, 2u8)
    check(1u16, 2u16)
    check(1u32, 2u32)
    check(1u64, 2u64)
    check(1.0f16, 2.0f16)
    check(1.0f32, 2.0f32)
    check(1.0f64, 2.0f64)
    check(true, false)
    check(r'1', r'2')
    check("1", "2")
    check(["1"], ["2"])
    check(1..2, 1..3)

    0
}
