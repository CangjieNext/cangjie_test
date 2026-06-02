/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_22_a03_01

  @Level:         1

  @Assertion: 4.22(3)
              The syntax of flow expression is defined as follows:

              flowExpression
                  : logicDisjunctionExpression (flowOperator logicDisjunctionExpression)*
                  ;

              flowOperator
                  : '|>' | '~>'
                  ;

  @Description: Check flow expressions positive examples.

  @Mode: run

  @Negative: no
*/

func sqr(x: Int64) {
    x * x
}

func addFive(x: Int64) {
    x + 5
}

func addSix(x: Int64) {
    x + 5
}

func isTrue(x: Bool) {
    x
}

func isFalse(x: Bool) {
    !x
}

main() {
    var x = 0
    var b = true

    // Rule:  flowExpression = logicDisjunctionExpression (flowOperator logicDisjunctionExpression)*
    // Case:  flowExpression = logicDisjunctionExpression flowOperator logicDisjunctionExpression
    //            flowOperator = '|>'
    x = 2 |> sqr
    x = 2 + 2 |> sqr
    x = x + 2 * 2 |> sqr
    x = 0 | 2 |> sqr
    x = 0 & 2 |> sqr
    x = 0 ^ 1 |> sqr
    b = true |> isTrue
    b = b || false |> isTrue
    b = b && true |> isTrue

    // Rule:  flowExpression = logicDisjunctionExpression (flowOperator logicDisjunctionExpression)*
    // Case:  flowExpression = logicDisjunctionExpression flowOperator
    //                         logicDisjunctionExpression flowOperator
    //                         logicDisjunctionExpression
    //            flowOperator = '|>'
    x = 2 |> sqr |> addFive
    b = false |> isTrue |> isFalse

    // Rule:  flowExpression = logicDisjunctionExpression (flowOperator logicDisjunctionExpression)*
    // Case:  flowExpression = logicDisjunctionExpression flowOperator logicDisjunctionExpression
    //            flowOperator = '~>'
    var f1 = addFive ~> sqr

    // Rule:  flowExpression = logicDisjunctionExpression (flowOperator logicDisjunctionExpression)*
    // Case:  flowExpression = logicDisjunctionExpression flowOperator
    //                         logicDisjunctionExpression flowOperator
    //                         logicDisjunctionExpression
    //            flowOperator = '~>'
    var f2 = addFive ~> sqr ~> addSix
}

