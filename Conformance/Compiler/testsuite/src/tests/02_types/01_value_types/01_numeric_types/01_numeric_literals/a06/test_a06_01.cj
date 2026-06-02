/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a06_01

  @Level:         1
  @Assertion:   2.1.1.1(6) Floating-point types in the Cangjie programming language are represented using the IEEE 754
                formats.
  @Description: Check that floating-point literals equal to each other
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006075
*/

import utils.assert.Assert

main() {
  let f16_1: Float16 = 2.718
  var f16_2: Float16 = 271.8e-2
  let f16_3: Float16 = 0.002718e3
  var f16_NaN: Float16 = 0.0/0.0
  Assert.equals(f16_1, f16_1)
  Assert.equals(f16_1, f16_2)
  Assert.equals(f16_1, f16_3)
  Assert.equals(f16_2, f16_3)
  Assert.equals(Float16.NaN, f16_NaN)

  let f32_1: Float32 = 2.718
  var f32_2: Float32 = 271.8e-2
  let f32_3: Float32 = 0.002718e3
  var f32_NaN: Float32 = 0.0/0.0
  Assert.equals(f32_1, f32_1)
  Assert.equals(f32_1, f32_2)
  Assert.equals(f32_1, f32_3)
  Assert.equals(f32_2, f32_3)
  Assert.equals(Float32.NaN, f32_NaN)

  let f64_1: Float64 = 2.718
  var f64_2: Float64 = 271.8e-2
  let f64_3: Float64 = 0.002718e3
  var f64_NaN: Float64 = 0.0/0.0
  Assert.equals(f64_1, f64_1)
  Assert.equals(f64_1, f64_2)
  Assert.equals(f64_1, f64_3)
  Assert.equals(f64_2, f64_3)
  Assert.equals(Float64.NaN, f64_NaN)
  return 0
}