/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_03_a01_01

  @Level:         1

  @Assertion: 4.13.3(1) The syntax of a index access expression is defined as the rule 5 of the syntax of
              the postfix expression
              above, where the syntax of indexAccess is defined as follows:

              indexAccess
                  : '[' (expression | rangeElement) ']'
                  ;

              rangeElement
                  : '..'
                  | ('..=' | '..' ) expression
                  | expression '..'
                  ;

  @Description: Check usages of index access expression.

  @Mode: run

  @Negative: no

*/

// NOTE: Rule 5 is "postfixExpression indexAccess".

import utils.assert.Assert

main() {
    let a = [1, 2, 3, 4, 5]
    let t = (1, 2, 3, 4, 5)

    // Case: exression in index access.
    let x1 = a[2]
    Assert.equals(3, x1)
    let x2 = a[x1 - 1]
    Assert.equals(3, x2)
    let x3 = t[3]
    Assert.equals(4, x3)

    // Case: range element is ".."
    let r1 = a[..]
    Assert.isTrue(r1 == [1, 2, 3, 4, 5])

    // Case: range element is "'..=' expression"
    let q1 = a[..=3]
    Assert.isTrue(q1 == [1, 2, 3, 4])
    let q2 = a[..=x1]
    Assert.isTrue(q2 == [1, 2, 3, 4])

    // Case: range element is "'..' expression"
    let p1 = a[..3]
    Assert.isTrue(p1 == [1, 2, 3])
    let p2 = a[..x1]
    Assert.isTrue(p2 == [1, 2, 3])

    // Case: range element is "expression '..'"
    let s1 = a[1..]
    Assert.isTrue(s1 == [2, 3, 4, 5])
    let s2 = a[(x1 - 2)..]
    Assert.isTrue(s2 == [2, 3, 4, 5])
}

