/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a23_01

  @Level:         1
  @Assertion:   2.1.1.1(23) The largest representational positive (2 − 2^−52) × 2^1023, approximately 1.79769e308.
  @Description: Check example
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
  var f64: Float64 = 1.7976931348623157e308
  var f64_1: Float64 = Float64((2.0 - (2.0 ** -52)) * (2.0 ** 1023))
  Assert.equals(f64_1, f64)
  Assert.equals(Float64.Max, f64)
  Assert.equals(Float64.Max, f64_1)

  return 0
}