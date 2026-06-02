/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a07_01

  @Level:         1
  @Assertion:   2.1.1.1(7) In particular, Float16 corresponds to the half-precision format (16-bit) in IEEE 754; Float32 corresponds to the single-precision format (32-bit) in IEEE 754, and Float64 corresponds to the double-precision format(64- bit) in IEEE 754.
  @Description: Check that limitations of each format are correct
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
  let f16_max: Float16 = 65504.0
  var f16_inf: Float16 = f16_max + 16.0 // + 2^5
  Assert.equals(6.5504e4, f16_max)
  Assert.notEquals(Float16(1.0/0.0), f16_max)
  Assert.equals(Float16(1.0/0.0), f16_inf)

  let f16_min: Float16 = 5.9604645e-8
  var f16_zero: Float16 = f16_min / 2.0
  Assert.equals(5.9604645e-8, f16_min)
  Assert.notEquals(0.0, f16_min)
  Assert.isTrue(f16_min > 0.0)
  Assert.equals(0.0, f16_zero)

  let f32_max: Float32 = 3.4028234664e38
  var f32_inf: Float32 = f32_max + 1.01412048e31 // + 2^103
  Assert.equals(3.4028234664e38, f32_max)
  Assert.notEquals(Float32(1.0/0.0), f32_max)
  Assert.equals(Float32(1.0/0.0), f32_inf)

  let f32_min: Float32 = 1.4012984643E-45
  var f32_zero: Float32 = f32_min / 2.0
  Assert.equals(1.4012984643E-45, f32_min)
  Assert.notEquals(0.0, f32_min)
  Assert.isTrue(f32_min > 0.0)
  Assert.equals(0.0, f32_zero)

  let f64_max: Float64 = 1.7976931348623157e308
  var f64_inf: Float64 = f64_max + 9.97920155e291 // + 2^970
  Assert.equals(1.7976931348623157e308, f64_max)
  Assert.notEquals(Float64(1.0/0.0), f64_max)
  Assert.equals(Float64(1.0/0.0), f64_inf)

  let f64_min: Float64 = 4.9406564584124654e-324
  var f64_zero: Float64 = f64_min / 2.0
  Assert.equals(4.9406564584124654e-324, f64_min)
  Assert.notEquals(0.0, f64_min)
  Assert.isTrue(f64_min > 0.0)
  Assert.equals(0.0, f64_zero)
  return 0
}