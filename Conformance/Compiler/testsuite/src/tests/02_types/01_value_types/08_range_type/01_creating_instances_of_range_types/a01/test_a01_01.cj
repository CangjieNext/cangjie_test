/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_01_a01_01

  @Level:         1
  @Assertion:       2.1.8.1(1) There are two Range operators: .. and ..= which are used to create
                    half-open range instances and closed range instances, respectively.  

  @Description:     Checks half-open and closed range instances.

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/

import utils.assert.Assert

main() {
  let a1 = 0..5
  let a2 = 0..=5

  var range_str: String

  range_str = ""
  for (el in a1) {
    range_str += el.toString()
  }
  Assert.equals("01234", range_str)

  range_str = ""
  for (el in a2) {
    range_str += el.toString()
  }
  Assert.equals("012345", range_str)

  return 0
}
