/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a55_02

  @Level:         1

  @Assertion: 4.28(55) The evaluation orders are defined as follows in the Cangjie programming language.

              1. For expressions that contains logic AND (&&), logic OR (||), and coalescing (??), the evaluation
                 order of is left to right.

  @Description: Check the evaluation order of '||'.

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

    return false
}

func getB() {
    evalOrderCounter++
    evalOrderB = evalOrderCounter

    return false
}

func getC() {
    evalOrderCounter++
    evalOrderC = evalOrderCounter

    return false
}

main() {
    let b = getA() || getB() || getC()
    Assert.isFalse(b)
    Assert.equals(1, evalOrderA)
    Assert.equals(2, evalOrderB)
    Assert.equals(3, evalOrderC)
    return
}

