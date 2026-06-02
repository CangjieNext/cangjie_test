
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a32_01

  @Level:         1

  @Assertion:   4.23(32) Multi-assignment expressions can assign the value of the right tuple type to the corresponding
                left value in the left tuple at once, eliminating the need to assign the value one by one.
  @Description: Checks that multi-assignment expression assigns values of the right tuple to the corresponding
                values in the left tuple.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C {
    let x : Int64
    init(y : Int64) { x = y }

    operator func ==(other : C) { x == other.x }
}

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
let tNew = (2i8, 2i16, 2i32, 2i64, 2u8, 2u16, 2u32, 2u64, 2.0f16, 2.0f32, 2.0f64,
            false, r'2', "2", 2..3, (2, r'1'), C(2))

main() {
    (i8, i16, i32, i64, u8, u16, u32, u64, f16, f32, f64, b, c, s, r, t, o) = tNew
    Assert.isTrue(i8 == tNew[0])
    Assert.isTrue(i16 == tNew[1])
    Assert.isTrue(i32 == tNew[2])
    Assert.isTrue(i64 == tNew[3])
    Assert.isTrue(u8 == tNew[4])
    Assert.isTrue(u16 == tNew[5])
    Assert.isTrue(u32 == tNew[6])
    Assert.isTrue(u64 == tNew[7])
    Assert.isTrue(f16 == tNew[8])
    Assert.isTrue(f32 == tNew[9])
    Assert.isTrue(f64 == tNew[10])
    Assert.isTrue(b == tNew[11])
    Assert.isTrue(c == tNew[12])
    Assert.isTrue(s == tNew[13])
    Assert.isTrue(r == tNew[14])
    Assert.isTrue(t == tNew[15])
    Assert.isTrue(o == tNew[16])
}
