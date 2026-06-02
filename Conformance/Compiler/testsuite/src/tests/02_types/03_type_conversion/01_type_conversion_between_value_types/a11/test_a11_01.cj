/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a11_01

  @Level:         1

  @Assertion:    2.3.1(11) Bidirectional conversion between signed integers: A value is unchanged when it is converted
                 from a smaller type to a bigger type.

  @Description:  Check that the value is unchanged when it is converted from a smaller type to a bigger type for
                 signed integers

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let i8_i16 = Int16(34_i8)
let i8_i32 = Int32(-35_i8)
let i8_i64 = Int64(36_i8)
let i8_iN = IntNative(-37_i8)

var i16_i32 = Int32(-3572_i16)
var i16_i64 = Int64(3624_i16)
var i16_iN = IntNative(-3762_i16)

var i32_i64 = Int64(362456123_i32)
var i32_iN = IntNative(-376225124_i32)

main(): Unit {
    Assert.equals(34, i8_i16)
    Assert.equals(-35, i8_i32)
    Assert.equals(36, i8_i64)
    Assert.equals(-37, i8_iN)
    Assert.equals(-3572, i16_i32)
    Assert.equals(3624, i16_i64)
    Assert.equals(-3762, i16_iN)
    Assert.equals(362456123, i32_i64)
    Assert.equals(-376225124, i32_iN)
}
