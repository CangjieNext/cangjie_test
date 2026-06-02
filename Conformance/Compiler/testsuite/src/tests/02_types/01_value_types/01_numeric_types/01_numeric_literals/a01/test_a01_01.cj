/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_01_a01_01

  @Level:         1
  @Assertion:   2.1.1.1(1) Terms such as 5, 24, 2.9, and 3.14 are referred to as numeric literals.
                Literals can be referred to only by their values and their values cannot be changed.
  @Description: Check that numeric literals equals itself.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert

main() {
  Assert.equals(5, 5)
  Assert.equals(24, 24)
  Assert.equals(2.9, 2.9)
  Assert.equals(3.14, 3.14)
  Assert.isTrue(5 is Int64)
  Assert.isTrue(24 is Int64)
  Assert.isTrue(2.9 is Float64)
  Assert.isTrue(3.14 is Float64)
  return 0
}