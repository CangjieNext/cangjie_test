/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_02

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the
              value of an expression is called the evaluation of the expression.
  @Description: Checks that variables are expressions which have a type and a
                value.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

main() {
    var i1: Int32 = 14
    Assert.equals(14, i1)
    Assert.notEquals(28, i1)
    Assert.isTrue(i1 is Int32)

    let i2 = 14
    Assert.equals(14, i2)
    Assert.notEquals(28, i2)
    Assert.isTrue(i2 is Int64)

    var str: String
    str = ""
    Assert.equals("", str)
    Assert.notEquals("Hello", str)
    Assert.isTrue(str is String)

    str = "abcd"
    Assert.equals("abcd", str)
    Assert.notEquals("", str)
    Assert.notEquals("Hello", str)
    Assert.isTrue(str is String)

    let phi: Float64 
    phi = 3.14
    Assert.equals(3.14, phi)
    Assert.isTrue(phi is Float64)
}
