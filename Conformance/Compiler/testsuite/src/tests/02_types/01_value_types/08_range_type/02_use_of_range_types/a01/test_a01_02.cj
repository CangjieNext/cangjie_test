/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_02_a01_02

  @Level:         1
  @Assertion:       2.1.8.2(1) Range expressions can be used as a part of the for in expressions
                    (refer to Loop Expressions) or can be used as index for slicing.

  @Description:     Checks that range expressions can be used as a part of the for in expressions.

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/

import utils.assert.Assert

main() {

  var range_str: String

  range_str = ""
  for (el in 0..10) {
    range_str += el.toString()
  }
  Assert.equals("0123456789", range_str)

  range_str = ""
  for (el in -5..=10) {
    range_str += el.toString()
  }
  Assert.equals("-5-4-3-2-1012345678910", range_str)

  range_str = ""
  for (el in 8..20:2) {
    range_str += el.toString()
  }
  Assert.equals("81012141618", range_str)

  range_str = ""
  for (el in -3..=10:3) {
    range_str += el.toString()
  }
  Assert.equals("-30369", range_str)

  range_str = ""
  for (el in 12..=10) {
    range_str += el.toString()
  }
  Assert.equals("", range_str)

  range_str = ""
  for (el in 80..130:22) {
    range_str += el.toString()
  }
  Assert.equals("80102124", range_str)

  range_str = ""
  for (el in 7i8..5i8:-1) {
    range_str += el.toString()
  }
  Assert.equals("76", range_str)

  range_str = ""
  for (el in 130i32..80i32:-22) {
    range_str += el.toString()
  }
  Assert.equals("13010886", range_str)

  return 0
}
