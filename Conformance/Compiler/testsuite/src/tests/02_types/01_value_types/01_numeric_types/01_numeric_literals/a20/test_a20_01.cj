/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a20_01

  @Level:         1
  @Assertion:   2.1.1.1(20) For Float32, the smallest representational positive number is 2^−149, approximately 1.4e-45.
  @Description: Check example
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
  var f32: Float32 = 1.4012984643E-45
  var f32_1: Float32 = Float32(2.0 ** -149)
  Assert.equals(f32_1, f32)
  Assert.notEquals(0.0, f32)
  Assert.notEquals(0.0, f32_1)

  return 0
}