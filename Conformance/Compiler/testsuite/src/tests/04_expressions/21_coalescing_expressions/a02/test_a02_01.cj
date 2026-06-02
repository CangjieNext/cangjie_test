/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_21_a02_01

  @Level:         1

  @Assertion: 4.21(2)
              The syntax of the coalescing expression is defined as:

              coalescingExpression
                  : logicDisjunctionExpression ('??' logicDisjunctionExpression)*
                  ;

  @Description: Check coalescing expressions syntax positive examples.

  @Mode: run

  @Negative: no

  @Issue: 0006482
*/

main() {
    var c1: ?Int64 = 0
    var c2: ?Int64 = 0
    var c3 = Option<Int64>.None

    // Rule:  coalescingExpression = logicDisjunctionExpression ('??' logicDisjunctionExpression)*
    // Case:  coalescingExpression = logicDisjunctionExpression '??' logicDisjunctionExpression
    //            logicDisjunctionExpression = logicConjunctionExpression
    c2 = c1 ?? c2
    c2 = c3 ?? c2

    // Rule:  coalescingExpression = logicDisjunctionExpression ('??' logicDisjunctionExpression)*
    // Case:  coalescingExpression = logicDisjunctionExpression '??'
    //                               logicDisjunctionExpression '??'
    //                               logicDisjunctionExpression
    //            logicDisjunctionExpression = logicConjunctionExpression
    c2 = c1 ?? c2 ?? c2
    c2 = c3 ?? c1 ?? c2
    c2 = c3 ?? c3 ?? c1
}

