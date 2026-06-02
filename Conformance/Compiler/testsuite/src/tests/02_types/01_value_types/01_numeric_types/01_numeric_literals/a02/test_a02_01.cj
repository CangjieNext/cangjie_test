/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a02_01

  @Level:         1
  @Assertion:   2.1.1.1(2) Integer literals can be written in four bases: binary, octal, decimal, and hexadecimal.
  @Description: Check that four bases for integer literals give the same value.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
  // positive values
  Assert.equals(5, 0b0101)
  Assert.equals(33, 0o041)
  Assert.equals(65, 0x041)
  Assert.equals(0b0101, 0o05) // 5
  Assert.equals(0b0101, 0x05) // 5
  Assert.equals(0x041, 0o101) // 65
  // negative values
  Assert.equals(-5, -0b0101)
  Assert.equals(-33, -0o041)
  Assert.equals(-65, -0x041)
  Assert.equals(-0b0101, -0o05) // -5
  Assert.equals(-0b0101, -0x05) // -5
  Assert.equals(-0x041, -0o101) // -65
  return 0
}