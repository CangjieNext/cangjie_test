/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a05_01

  @Level:         1

  @Assertion: 4.14(5) The syntax of the increment and decrement expression is defined as follows:

              incAndDecExpression
                  : postfixExpression ('++' | '--' )?

  @Description: Check the increment and decrement expressions usages with different syntax.

  @Mode: run

  @Negative: no

  @Issue: 0006407

*/

import utils.assert.Assert

class S {
    var x: Int64 = 0
}

main() {
    var counter = 0

    // Case: postfixExpression = atomicExpression = identifier.
    counter++
    Assert.equals(1, counter)
    counter--
    Assert.equals(0, counter)

    // Case: postfixExpression = type '.' identifier.
    var s = S()
    s.x++
    Assert.equals(1, s.x)
    s.x--
    Assert.equals(0, s.x)

    // Case: postfixExpression = postfixExpression ('?' questSeparatedItems)+.
    var maybeS: ?S = S()
    maybeS?.x++
    Assert.equals(1, maybeS?.x ?? 1709)
    maybeS?.x--
    Assert.equals(0, maybeS?.x ?? 1709)
}

