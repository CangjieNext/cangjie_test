
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a04_01

  @Level:         1
  @Assertion:   12.1.1.1(4) Decimal literals do not require a prefix.
  @Description: Check that with prefix e and E for decimal literals is parsed as floating point literals.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
import utils.assert.Assert

main() {
  let val1 = 0e12345
  let val2 = 0E12345
  Assert.equals(0.0, val1)
  Assert.equals(0.0, val2)
  Assert.isTrue(val1 is Float64)
  Assert.isTrue(val2 is Float64)
  return 0
}
