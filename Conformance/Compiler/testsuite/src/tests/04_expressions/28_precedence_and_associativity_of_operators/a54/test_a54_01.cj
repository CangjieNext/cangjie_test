/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a54_01

  @Level:         1

  @Assertion: 4.28(54) ## Evaluation Order of Expressions

              The evaluation order of the expression specifies the order in which the operands are evaluated.
              Evaluation orders are naturally only defined for expressions that contains binary operators.

  @Description: Check the evaluation order example.

  @Mode: run

  @Negative: no

*/

// NOTE: Detailed evaluation order checks will be tested in the next assertions. No need to duplicate tests here.

import utils.assert.Assert

var evalOrderCounter = 0
var evalOrderA = 0
var evalOrderB = 0

func getA() {
    evalOrderCounter++
    evalOrderA = evalOrderCounter

    return 2
}

func getB() {
    evalOrderCounter++
    evalOrderB = evalOrderCounter

    return 3
}


main() {
    // Test: +
    evalOrderCounter = 0
    evalOrderA = 0
    evalOrderB = 0
    getA() + getB()
    Assert.equals(1, evalOrderA)
    Assert.equals(2, evalOrderB)

    // Test: *
    evalOrderCounter = 0
    evalOrderA = 0
    evalOrderB = 0
    getA() * getB()
    Assert.equals(1, evalOrderA)
    Assert.equals(2, evalOrderB)

    return
}

