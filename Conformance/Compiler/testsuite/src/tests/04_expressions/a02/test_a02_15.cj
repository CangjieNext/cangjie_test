/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_15

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that relational expressions have type and value.
                Tests: equal (==), not equal (!=), less than (<), less than or 
                equal (<=), greater than (>), and greater than or equal (>=).
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

let i: Int32 = 12
var j: Int32 = 7

main() {
    Assert.isTrue((i == j) is Bool)
    Assert.isFalse(i == j)

    Assert.isTrue((i != j) is Bool)
    Assert.isFalse(i == j)

    Assert.isTrue((i < j) is Bool)
    Assert.isFalse(i < j)

    Assert.isTrue((i <= 7) is Bool)
    Assert.isTrue(i <= 32)

    Assert.isTrue((i > j) is Bool)
    Assert.isTrue(i > j)

    Assert.isTrue((i >= 7) is Bool)
    Assert.isTrue(j >= 7)
}
