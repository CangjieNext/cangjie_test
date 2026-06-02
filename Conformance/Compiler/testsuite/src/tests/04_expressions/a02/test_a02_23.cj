/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_23

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that lambda expressions have type and value.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

main() {
    var v = { a: Int64, b: Int64 => a + b }
    Assert.isTrue(v is ((Int64, Int64) -> Int64))
    Assert.equals(3, v(1, 2))
}
