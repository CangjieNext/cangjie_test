/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_07_a11_01

  @Level:         1

  @Assertion: 4.7(11)
              The syntax of control transfer expressions is defined as follows.

              jumpExpression
                  : 'break'
                  | 'continue'
                  | 'return' expression?
                  | 'throw' expression
                  ;

  @Description: Check jumpExpression syntax positive examples.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func testBreak() {
    var result = 0
    for (x in [1, 2, 3, 4]) {
        if (x == 2) {
            result = 1

            // Case: jumpExpression = break
            break
        }
    }

    // Case: jumpExpression = return expression
    return result
}

func testContinue() {
    var result = 0
    for (x in [1, 2, 3, 4]) {
        if (x >= 3) {

            // Case: jumpExpression = continue
            continue
        }

        result = x
    }

    // Case: jumpExpression = return expression
    return result
}

func testReturn() {
    for (x in [1, 2, 3, 4]) {
        if (x == 2) {
            // Case: jumpExpression = return
            return
        }
    }

    Assert.fail()
}

func testThrow(inp: Array<String>) {
    var result = 0
    try {
        // Case: jumpExpression = throw expression
        if (Assert.getRuntimeZero(inp) == 0) {throw Exception("hello!")}
        result = 1
    } catch (e: Exception) {
    }

    return result
}

main(inp: Array<String>) {
    Assert.equals(1, testBreak())
    Assert.equals(2, testContinue())
    testReturn()
    Assert.equals(0, testThrow(inp))
}
