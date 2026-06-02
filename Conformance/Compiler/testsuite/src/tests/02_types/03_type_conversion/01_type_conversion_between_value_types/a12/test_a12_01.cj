/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a12_01

  @Level:         1

  @Assertion:    2.3.1(12) When a value is converted from a bigger type to a smaller type, if the value is beyond the
                 range of the smaller type, then the overflow strategy is determined by the attributed macro used in
                 the context (the default strategy is throwing exceptions), see Arithmetic Expressions for details of
                 the different overflow strategies

  @Description:  Check that the value is unchanged when it is converted from a bigger type to a smaller type for
                 signed integers when  the value is within the range of the smaller type

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let i8_i16 = Int8(34_i16)
let i8_i32 = Int8(-35_i32)
let i8_i64 = Int8(36_i64)
let i8_iN = Int8(IntNative(-37))

var i16_i32 = Int16(-3572_i32)
var i16_i64 = Int16(3624_i64)
var i16_iN = Int16(IntNative(-3762))

var i32_i64 = Int32(362456123_i64)
var i32_iN = Int32(IntNative(-376225124))

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
