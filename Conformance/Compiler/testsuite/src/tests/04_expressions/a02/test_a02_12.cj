/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_12

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that parenthesized expressions have a type and a value.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var i: Int16 = 5
var j: Int16 = 123
var k: Int16 = 0

main() {
    Assert.isTrue((i + j + k) is Int16)
    Assert.equals(128, (i + j+ k))

    Assert.isTrue(((i + j) + k) is Int16)
    Assert.equals(128, ((i + j) + k))

    Assert.isTrue((i + ( j + k)) is Int16)
    Assert.equals(128, (i + (j + k)))

    Assert.isTrue((((i +  j + k))) is Int16)
    Assert.equals(128, ((i + (j + k))))
}
