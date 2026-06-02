/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a10_01

  @Level:         1
  @Assertion:   2.1.1.1(10) An exponential part (prefixed with e or E, and base 10) is required when there is no decimal part.
  @Description: Check that without fractional part but with exponential part floating-point literal parsed correctly
  @Mode:        run
  @Negative:    no
  @CompileWarning: Ignore
  @Structure:   single
*/

import utils.assert.Assert

main() {
  let f16_1: Float16 = 1e5
  var f16_2: Float16 = 1e-5
  var f16_3: Float16 = 123e0
  Assert.equals(100000.0, f16_1)
  Assert.equals(0.00001, f16_2)
  Assert.equals(123.0, f16_3)
  
  let f32_1: Float32 = 1e6
  var f32_2: Float32 = 1e-6
  var f32_3: Float32 = 321e0
  Assert.equals(1000000.0, f32_1)
  Assert.equals(0.000001, f32_2)
  Assert.equals(321.0, f32_3)
  
  let f64_1: Float64 = 1e7
  var f64_2: Float64 = 1e-7
  var f64_3: Float64 = 586e0
  Assert.equals(10000000.0, f64_1)
  Assert.equals(0.0000001, f64_2)
  Assert.equals(586.0, f64_3)
  
  return 0
}