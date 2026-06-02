/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a01_04

  @Level:         1

  @Assertion: 4.5.2(1) The syntax of the while expression is defined as follows.
              whileExpression
              'while' '(' ('let' deconstructPattern '<-')? expression ')' block
               ;
               where while is the keyword, while is followed by a parenthesis, which can be an expression
               or a let-declared variable definition, followed by a block.
  @Description: Check some examples of while loops
  @Mode: run
  @Negative: no
  @CompileWarning: ignore
  @Issue: 6473

*/

import utils.assert.Assert

func less(i: Int64, j: Int64) { i < j }

main() {

    var i = Assert.getRuntimeZero()

    while (less(i, 5)) {
        i++
    }
    Assert.equals(5, i);

    while (less(i, 0)) {
        Assert.fail(reason: "Should not reach place 1")
    }

    while (let i <- i) {
        Assert.equals(5, i)
        break
    }

    while (let 100 <- i) {
        Assert.fail(reason: "Should not reach place 2")
    }

    while (let Some(x) <- None<Int64>) {
        Assert.fail(reason: "Should not reach place 3")
    }

    var o = Some<Int64>(123)
    while (let Some(x) <- o) {
        Assert.equals(123, x);
        o = None<Int64>
    }
}
