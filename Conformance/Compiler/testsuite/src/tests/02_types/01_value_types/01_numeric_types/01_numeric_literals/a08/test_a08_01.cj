/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a08_01

  @Level:         1
  @Assertion:   2.1.1.1(8) A floating-point literal usually contains an integer part, a fractional part (including a decimal point), and an exponential part.
  @Description: Check that various combinations of parts parsed correctly
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
  let f16_1: Float16 = 1e2 // integer and exponential parts
  Assert.equals(100.0, f16_1)
  var f16_2: Float16 = 1.2 // integer and fractional parts
  Assert.equals(1.2, f16_2)
  var f16_3: Float16 = .2e3 // fractional and exponential parts
  Assert.equals(200.0, f16_3)
  var f16_4: Float16 = .23 // only fractional part
  Assert.equals(0.23, f16_4)
  var f16_5: Float16 = 321.2e-2 // integer and fractional and exponential parts
  Assert.equals(3.212, f16_5)

  let f32_1: Float32 = 1e2 // integer and exponential parts
  Assert.equals(100.0, f32_1)
  var f32_2: Float32 = 1.2 // integer and fractional parts
  Assert.equals(1.2, f32_2)
  var f32_3: Float32 = .2e3 // fractional and exponential parts
  Assert.equals(200.0, f32_3)
  var f32_4: Float32 = .23 // only fractional part
  Assert.equals(0.23, f32_4)
  var f32_5: Float32 = 321.2e-2 // integer and fractional and exponential parts
  Assert.equals(3.212, f32_5)

  let f64_1: Float64 = 1e2 // integer and exponential parts
  Assert.equals(100.0, f64_1)
  var f64_2: Float64 = 1.2 // integer and fractional parts
  Assert.equals(1.2, f64_2)
  var f64_3: Float64 = .2e3 // fractional and exponential parts
  Assert.equals(200.0, f64_3)
  var f64_4: Float64 = .23 // only fractional part
  Assert.equals(0.23, f64_4)
  var f64_5: Float64 = 321.2e-2 // integer and fractional and exponential parts
  Assert.equals(3.212, f64_5)
  return 0
}