/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a14_01

  @Level:         1
  @Assertion:   2.1.1.1(14) For example, if two large floating-point numbers are multiplied or a non-zero number is
                divided by 0, the result is infinity.
  @Description: Check examples
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       6075
*/

import utils.assert.Assert

main() {
  var f16: Float16 = (Float16.Max / 2.0) * 3.0
  Assert.equals(Float16.Inf, f16)

  var f32: Float32 = (Float32.Max / 2.0) * 3.0
  Assert.equals(Float32.Inf, f32)

  var f64: Float64 = (Float64.Max / 2.0) * -3.0
  Assert.equals(-Float64.Inf, f64)

  var f16_2: Float16 = 16.0 / 0.0
  Assert.equals(Float16.Inf, f16_2)

  var f32_2: Float32 = -2.0 / 0.0
  Assert.equals(-Float32.Inf, f32_2)

  var f64_2: Float64 = 0.5 / 0.0
  Assert.equals(Float64.Inf, f64_2)
  return 0
}