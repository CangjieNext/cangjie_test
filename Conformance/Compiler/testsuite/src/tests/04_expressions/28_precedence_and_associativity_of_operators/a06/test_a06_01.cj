/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a06_01

  @Level:         1

  @Assertion: 4.28(6) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description    Usage          Expression type

              []        Left associative   Index access   varName[expr]  The type of the element of varName

  @Description: Check that '[]' is left associative.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

var evalOrderCounter = 0
var accessAOrder = 0
var accessBOrder = 0

class A {
    operator func[](index: Int64) {
        accessAOrder = evalOrderCounter
        evalOrderCounter++

        return
    }
}

class B {
    operator func[](index: Int64) {
        accessBOrder = evalOrderCounter
        evalOrderCounter++

        return A()
    }
}

main() {
    let b = B()

    b[0][0]

    Assert.equals(0, accessBOrder)
    Assert.equals(1, accessAOrder)
}

