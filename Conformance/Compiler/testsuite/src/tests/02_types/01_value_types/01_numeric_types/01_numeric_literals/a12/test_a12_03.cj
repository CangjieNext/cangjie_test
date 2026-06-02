/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a12_03

  @Level:         1
  @Assertion:   2.1.1.1(12) In addition, the following are additional special floating-point literals:
                positive infinity (POSITIVE_INFINITY), negative infinity (NEGATIVE_INFINITY), 
                Not a Number (NaN), positive 0 (+0.0) and negative 0 (-0.0).
  @Description: Check Not a Number (NaN)
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       6075,6100
*/

import utils.assert.Assert

main() {
  var f16: Float16 = Float16.NaN
  Assert.equals((1.0_f16/0.0_f16) * 0.0_f16, f16) //Infinity * 0

  var f32: Float32 = Float32.NaN
  Assert.equals((1.0_f32/0.0_f32) * 0.0_f32, f32) //Infinity * 0

  var f64: Float64 = Float64.NaN
  Assert.equals((1.0_f64/0.0_f64) * 0.0_f64, f64) //Infinity * 0

  Assert.notEquals(Float32(Float16.NaN), Float32.NaN)
  Assert.notEquals(Float64(Float16.NaN), Float64.NaN)
  Assert.notEquals(Float64.NaN, Float64(Float32.NaN))
  return 0
}