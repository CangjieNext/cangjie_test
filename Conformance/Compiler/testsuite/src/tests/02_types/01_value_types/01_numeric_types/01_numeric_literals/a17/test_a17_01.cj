/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a17_01

  @Level:         1
  @Assertion:   2.1.1.1(17) For example, the result of POSITIVE_INFINITY * 0 is NaN.
  @Description: Check example
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006075
*/

import utils.assert.Assert

main() {
  var f16: Float16 = 0.0 * Float16.Inf
  Assert.equals(Float16.NaN, f16)

  var f32: Float32 = Float32.Inf * 0.00000000
  Assert.equals(Float32.NaN, f32)

  var f64: Float64 = 0.0 * Float64.Inf
  Assert.equals(Float64.NaN, f64)

  return 0
}