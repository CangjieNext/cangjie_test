/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a01_06

  @Level:         1
  @Assertion:   2.1.1.1(1) Terms such as 5, 24, 2.9, and 3.14 are referred to as numeric literals.
                Literals can be referred to only by their values and their values cannot be changed.
  @Description: Check that variables with numeric literals equals itself and to another variable with the same numeric literal.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
  let a = 532
  var b = 532
  Assert.equals(532, a)
  Assert.equals(532, b)
  Assert.equals(a, b)
  Assert.equals(b, b)

  let c = 98.9
  var d = 98.9
  Assert.equals(98.9, c)
  Assert.equals(98.9, d)
  Assert.equals(c, d)
  Assert.equals(d, d)
  return 0
}