/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a30_01

  @Level:         1

  @Assertion: 4.28(30) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description            Usage           Expression type

              ^         Left associative   Bitwise XOR            expr1 ^ expr2   The type of expr1 or expr2, since
                                                                                  expr1 and expr2 have the same type
              |         Left associative   Bitwise OR             expr1 | expr2   The type of expr1 or expr2, since
                                                                                  expr1 and expr2 have the same type

  @Description: Check that '^' is left associative.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

var evalOrderCounter = 0
var evalOrderA = 0
var evalOrderB = 0

class A {
    operator func^(x: Int64) {
        evalOrderCounter++
        evalOrderA = evalOrderCounter

        return 42
    }
}

class B {
    operator func^(x: Int64) {
        evalOrderCounter++
        evalOrderB = evalOrderCounter

        return A()
    }
}

main() {
    var b = B()

    let x1 = b ^ 2 ^ 2
    let x2 = (b ^ 2) ^ 2
    let x3 = b ^ (2 ^ 2)
    Assert.equals(42, x1)
    Assert.equals(x1, x2)
    Assert.isTrue(x3 is A)

    return
}

