/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a11_01

  @Level:         1

  @Assertion: 4.28(11) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              !         Right associative  Bitwise Logic NOT !expr             The type of expr
              **        Right associative  Power             expr1 ** expr2    The type of expr1

  @Description: Check that '!' is right-associative.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

var evalOrderCounter = 0
var evalOrderA = 0
var evalOrderB = 0

class A {
    operator func!() {
        evalOrderCounter++
        evalOrderA = evalOrderCounter
    }
}

class B {
    operator func!() {
        evalOrderCounter++
        evalOrderB = evalOrderCounter

        return A()
    }
}

main() {
    let b = B()

    !!b
    Assert.equals(2, evalOrderA)
    Assert.equals(1, evalOrderB)

    return
}

