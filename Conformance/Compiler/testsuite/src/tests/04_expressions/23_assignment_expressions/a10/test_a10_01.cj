
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a10_01

  @Level:         1

  @Assertion:   4.23(10) Semantically, a left value expression can only be an expression of the following forms.
                1. Variables represented by identifier (see Variable Names and Function Names).
  @Description: Checks that assignment to a variable is permitted and gives correct result for various types.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

class C {
    let x : Int64
    init(y : Int64) { x = y }

    operator func ==(other : C) { x == other.x }
}

main() {
    var i8 = 1i8
    var i16 = 1i16
    var i32 = 1i32
    var i64 = 1i64
    var u8 = 1u8
    var u16 = 1u16
    var u32 = 1u32
    var u64 = 1u64
    var f16 = 1.0f16
    var f32 = 1.0f32
    var f64 = 1.0f64
    var b = true
    var c = r'1'
    var s = "1"
    var r = 1..2
    var t = (1, r'2')
    var o = C(1)
    var u : Unit
    var n : Nothing

    i8 = 2
    Assert.equals(2, i8)
    i16 = 2
    Assert.equals(2, i16)
    i32 = 2
    Assert.equals(2, i32)
    i64 = 2
    Assert.equals(2, i64)
    u8 = 2
    Assert.equals(2, u8)
    u16 = 2
    Assert.equals(2, u16)
    u32 = 2
    Assert.equals(2, u32)
    u64 = 2
    Assert.equals(2, u64)
    f16 = 2.0
    Assert.equals(2.0, f16)
    f32 = 2.0
    Assert.equals(2.0, f32)
    f64 = 2.0
    Assert.equals(2.0, f64)
    b = false
    Assert.equals(false, b)
    c = r'2'
    Assert.equals(r'2', c)
    s = "2"
    Assert.equals("2", s)
    r = 2..3
    Assert.equals(2..3, r)
    t = (2, r'1')
    Assert.isTrue((2, r'1') == t)
    o = C(2)
    Assert.isTrue(C(2) == o)
    u = ()
    Assert.isTrue(() == u)
    do { n = break } while(false)

    return 0
}
