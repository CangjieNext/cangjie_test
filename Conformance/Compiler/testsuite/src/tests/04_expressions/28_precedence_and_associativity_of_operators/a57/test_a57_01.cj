/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a57_01

  @Level:         1

  @Assertion: 4.28(57) The evaluation orders are defined as follows in the Cangjie programming language.

              2. For optional chaining expressions, the ? separates the expression into a number of subexpressions,
                 which are evaluated in left-to-right order (the subexpression is evaluated in the order decided by
                 operators it used).

  @Description: Check the evaluation order of optional chaining expression.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

var evalOrderCounter = 0
var evalOrderA = 0
var evalOrderB = 0
var evalOrderC = 0

class B {
    func getC() {
        evalOrderCounter++
        evalOrderC = evalOrderCounter

        return true
    }
}

class A {
    func getB() {
        evalOrderCounter++
        evalOrderB = evalOrderCounter

        return Option<B>.Some(B())
    }
}

func getA() {
    evalOrderCounter++
    evalOrderA = evalOrderCounter

    return Option<A>.Some(A())
}

main() {
    let b = getA()?.getB()?.getC()
    Assert.isTrue(b == true)
    Assert.equals(1, evalOrderA)
    Assert.equals(2, evalOrderB)
    Assert.equals(3, evalOrderC)
    return
}

