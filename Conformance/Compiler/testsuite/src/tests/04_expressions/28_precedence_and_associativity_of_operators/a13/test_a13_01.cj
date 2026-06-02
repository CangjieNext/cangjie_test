/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a13_01

  @Level:         1

  @Assertion: 4.28(13) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              **        Right associative  Power             expr1 ** expr2    The type of expr1
              *         Left associative   Multiply          expr1 * expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type
              /         Left associative   Divide            expr1 / expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type
              %         Left associative   Remainder         expr1 % expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type

  @Description: Check that '**' is right-associative.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

var evalOrderCounter = 0
var evalOrderA = 0
var evalOrderB = 0

class A {
    operator func**(x: Int64) {
        evalOrderCounter++
        evalOrderA = evalOrderCounter

        return 42
    }
}

class B {
    operator func**(x: Int64) {
        evalOrderCounter++
        evalOrderB = evalOrderCounter

        return 35
    }
}

main() {
    var a = A()
    var b = B()

    // NOTE: Left associativity (b ** a) ** 2 would cause a compilation error.
    let x = b ** a ** 2
    Assert.equals(35, x)
    Assert.equals(1, evalOrderA)
    Assert.equals(2, evalOrderB)

    return
}

