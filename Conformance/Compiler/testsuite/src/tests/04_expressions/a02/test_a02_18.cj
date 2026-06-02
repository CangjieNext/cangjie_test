/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_18

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the
              value of an expression is called the evaluation of the expression.
  @Description: Checks that range expressions have type and value.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var range1 = 0..10
var range2 = 1..14:3

main() {
    var v1 = 0..10
    Assert.isTrue(v1 is Range<Int64>)
    Assert.equals(range1, v1)
  
    var v2 = 1..14:3
    Assert.isTrue(v2 is Range<Int64>)
    Assert.equals(range2, v2)
}
