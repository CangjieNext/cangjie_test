/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_02_a05_01

  @Level:         1

  @Assertion:    2.1.2(5)  Operations Defined for the Character Type
    Only relational operations are suppored for the Rune type(for which the comparison is based on Unicode code point).

  @Description:  Check that relational operations are supported for the Rune type

  @Mode:         run 

  @Negative:     no  

  @Structure:    single
 
*/

import utils.assert.Assert

main() {
  var a: Rune
  var b: Rune

  a = 'A'
  b = 'b'

  Assert.isTrue(a!=b)
  Assert.isFalse(a==b)
  Assert.isTrue(a==a)
  Assert.isTrue(b==b)
}