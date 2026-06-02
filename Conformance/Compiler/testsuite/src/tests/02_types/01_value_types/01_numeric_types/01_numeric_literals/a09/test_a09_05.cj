/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a09_05

  @Level:         1
  @Assertion:   2.1.1.1(9) There are two forms of representation: decimal or hexadecimal. In the decimal representation, a floating-point number must contain an integer part or a fractional part.
  @Description: Check that floating-piont with an integer part or a fractional part parsed correctly
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
  Assert.equals(1.0_f16, 100e-2_f16)
  Assert.equals(1.0_f16, .1e1f16)
  Assert.equals(0.4564_f16, .4564__f16)

  Assert.equals(1.0_f32, 1000e-3_f32)
  Assert.equals(1.0_f32, .01e2f32)
  Assert.equals(0.5432_f32, .5432__f32)

  Assert.equals(1.0_f64, 1000_000_000e-9_f64)
  Assert.equals(1.0_f64, .000_000_1e7f64)
  Assert.equals(0.0987641366756_f64, .0987641366756__f64)
  return 0
}