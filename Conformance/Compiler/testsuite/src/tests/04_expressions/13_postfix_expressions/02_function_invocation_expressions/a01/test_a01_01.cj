/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_02_a01_01

  @Level:         1

  @Assertion: 4.13.2(1) The syntax of a function invocation expression is defined as the rule 4
              of the syntax of the postfix
              expression above, where the syntax of callSuffix and valueArgument is defined as.

              callSuffix
                  : '(' (valueArgument (',' valueArgument)*)? ')'
                  ;

              valueArgument
                  : identifier ':' expression
                  | expression
                  | refTransferExpression
                  ;

              refTransferExpression
                  : 'inout' (expression '.')? identifier
                  ;

  @Description: Check usages of function invocation expression.

  @Mode: run

  @Negative: no
*/

// NOTE: Rule 4: "postfixExpression callSuffix"

import utils.assert.Assert

func f1() {
    return 1
}

func f2(x: Int64) {
    return 2
}

func f3(x: Int64, y: Int64) {
    return 3
}

func f4(name!: String) {
    return 4
}

func f5(name: String) {
    return 5
}

main() {
    // Empty value arguments list.
    let r1 = f1()
    Assert.equals(1, r1)

    // Single value argument.
    let r2 = f2(2)
    Assert.equals(2, r2)

    // Two value arguments.
    let r3 = f3(3, 4)
    Assert.equals(3, r3)

    // Case: valueArgument = "identifier ':' expression"
    // Named argument.
    let r4 = f4(name: "Catherine")
    Assert.equals(4, r4)

    // Case: valueArgument = "expression"
    // Unnamed argument.
    let r5 = f5("Peter")
    Assert.equals(5, r5)
}

