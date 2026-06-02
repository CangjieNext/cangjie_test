/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a58_06

  @Level:         1

  @Assertion: 4.28(58) The evaluation orders are defined as follows in the Cangjie programming language.

              3. For all other expressions, such as arithmetic expressions, relational expressions and bitwise
                 expressions etc., the evaluation order is from left to right.

  @Description: Check the evaluation order of '<<'.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

var evalOrderCounter = 0
var evalOrderA = 0
var evalOrderB = 0
var evalOrderC = 0

func getA() {
    evalOrderCounter++
    evalOrderA = evalOrderCounter

    return 1
}

func getB() {
    evalOrderCounter++
    evalOrderB = evalOrderCounter

    return 2
}

func getC() {
    evalOrderCounter++
    evalOrderC = evalOrderCounter

    return 3
}

main() {
    let x = getA() << getB() << getC()
    Assert.equals(32, x)
    Assert.equals(1, evalOrderA)
    Assert.equals(2, evalOrderB)
    Assert.equals(3, evalOrderC)
    return
}

