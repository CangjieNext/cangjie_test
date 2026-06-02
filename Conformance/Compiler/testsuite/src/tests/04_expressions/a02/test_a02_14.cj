/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_14

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the
              value of an expression is called the evaluation of the expression.
  @Description: Checks that increment, decrement and ariphmetic expressions 
                have type and value.
                Tests: increment (++), decrement (--), negative (-), add (+), 
                subtract(-), multiply(*), divide(/), remainder(%), power (**). 
  @Mode: run
  @Negative: no
  @Structure: single
*/

import utils.assert.Assert

var x: Int32 = 170
var y: Int32 = 10
var phi: Float64 = 3.14
var i: Int64 = 0;

main() {
    Assert.isTrue((i++) is Unit)
    Assert.equals(1, i)
  
    Assert.isTrue((i--) is Unit)
    Assert.equals(0, (i))

    Assert.isTrue((-x) is Int32)
    Assert.equals(-170, (-x))

    Assert.isTrue((2 + x) is Int32)
    Assert.equals(25, (y + 15))

    Assert.isTrue((x * y) is Int32)
    Assert.equals(4, (2 * 2))

    Assert.isTrue((x / 14) is Int32)
    Assert.equals(7, (15 / 2))

    Assert.isTrue((1999 % 9) is Int64)
    Assert.equals(1, (3 % 2))

    Assert.isTrue((phi ** 1.0) is Float64)
    Assert.equals(phi, (phi ** 1.0))
}
