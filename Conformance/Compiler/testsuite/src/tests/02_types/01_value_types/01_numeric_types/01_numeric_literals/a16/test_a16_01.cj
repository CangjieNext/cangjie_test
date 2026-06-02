/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a16_01

  @Level:         1
  @Assertion:   2.1.1.1(16) NaN represents a value that is neither a real value nor infinity.
  @Description: Create NaNs with various methods
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006075
*/

import utils.assert.Assert

main() {
  var f16: Float16 = 0.0 / 0.0
  Assert.equals(Float16.NaN, f16)
  var f16_1: Float16 = -Float16.Inf / Float16.Inf
  Assert.equals(Float16.NaN, f16_1)
  var f16_2: Float16 = Float16.Inf * 0.0 / 0.0
  Assert.equals(Float16.NaN, f16_2)

  var f32: Float32 = 0.0 / 0.0
  Assert.equals(Float32.NaN, f32)
  var f32_1: Float32 = -Float32.Inf / Float32.Inf
  Assert.equals(Float32.NaN, f32_1)
  var f32_2: Float32 = Float32.Inf * 0.0 / 0.0
  Assert.equals(Float32.NaN, f32_2)

  var f64: Float64 = 0.0 / 0.0
  Assert.equals(Float64.NaN, f64)
  var f64_1: Float64 = -Float64.Inf / Float64.Inf
  Assert.equals(Float64.NaN, f64_1)
  var f64_2: Float64 = Float64.Inf * 0.0 / 0.0
  Assert.equals(Float64.NaN, f64_2)

  return 0
}