/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a56_03

  @Level:         1

  @Assertion: 4.28(56) The evaluation orders are defined as follows in the Cangjie programming language.

              1. For expressions that contains logic AND (&&), logic OR (||), and coalescing (??), the evaluation
                 order of is left to right.

              Furthermore, for efficiency, the right operand is only evaluated when its value is relevant to the value
              of the whole expression.

  @Description: Check that right operator of '??' is only evaluated when its value is relevant to the value of the
                whole expression.

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

    return Option<String>.Some("hi")
}

func getB() {
    evalOrderCounter++
    evalOrderB = evalOrderCounter

    return Option<String>.None
}

func getC() {
    evalOrderCounter++
    evalOrderC = evalOrderCounter

    return "hello"
}

main() {
    let b = getA() ?? getB() ?? getC()
    Assert.equals("hi", b)
    Assert.equals(1, evalOrderA)
    Assert.equals(0, evalOrderB)
    Assert.equals(0, evalOrderC)
    return
}

