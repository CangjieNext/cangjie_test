/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_05_a03_01

  @Level:         1

  @Assertion: 4.5(3)
              The syntax of loop expressions is defined as follows.

              loopExpression
                  : forInExpression
                  | whileExpression
                  | doWhileExpression
                  ;

  @Description: Check loop expressions syntax.

  @Mode: run

  @Negative: no

  @Comment: No need to cover forInExpression, whileExpression and doWhileExpression rules in this test, because it is a
            responsibility of tests for assertions related to each rule respectively.

*/

import utils.assert.Assert

//
// Case: loopExpression = forInExpression
//

func test1() {
    var arr = [1, 2, 3, 4]
    var mul = 1
    for (x in arr) {
        mul *= x
    }
    Assert.equals(24, mul)
}

//
// Case: loopExpression = whileExpression
//

func test2() {
    var x = 1
    var mul = 1
    while (x <= 4) {
        mul *= x
        x++
    }
    Assert.equals(24, mul)
}

//
// Case: loopExpression = doWhileExpression
//

func test3() {
    var x = 1
    var mul = 1
    do {
        mul *= x
        x++
    } while (x <= 4)
    Assert.equals(24, mul)
}

main() {
    test1()
    test2()
    test3()
}

