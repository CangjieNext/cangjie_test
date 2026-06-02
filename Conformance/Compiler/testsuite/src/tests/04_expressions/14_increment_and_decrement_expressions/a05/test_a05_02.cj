/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a05_02

  @Level:         1

  @Assertion: 4.14(5) The syntax of the increment and decrement expression is defined as follows:

              incAndDecExpression
                  : postfixExpression ('++' | '--' )?

  @Description: Check the increment and decrement expressions syntax when
                postfixExpression = "postfixExpression indexAccess".

  @Mode: run

  @Negative: no

  @Issue: 0006408

*/

import utils.assert.Assert

main() {
    var arr = [1, 2, 3, 4, 5]
    arr[0]++
    Assert.equals(2, arr[0])
}

