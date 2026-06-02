/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a05_01

  @Level:         1
  @Assertion:   2.1.1.1(5) For example, the decimal value 24 may be written in any one of the following four forms, in which the underline _ acts as a separator for readability:
                  0b0001_1000 // Binary.
                  0o30 // Octal.
                  24 // Decimal.
                  0x18 // Hexadecimal.

  @Description: Check that sample literals equal to each other
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
  Assert.equals(24, 0b0001_1000)
  Assert.equals(24, 0o30)
  Assert.equals(24, 0x18)
  Assert.equals(0b0001_1000, 0o30)
  Assert.equals(0b0001_1000, 0x18)
  Assert.equals(0o30, 0x18)
  return 0
}