/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_20_a04_01

  @Level:         1

  @Assertion: 4.20(4)
              The syntax of logic expressions are defined as:

              prefixUnaryExpression
                  : prefixUnaryOperator* incAndDecExpression
                  ;

              prefixUnaryOperator
                  : '!'
                  | ...
                  ;

              logicDisjunctionExpression
                  : logicConjunctionExpression ( '||' logicConjunctionExpression)*
                  ;

              logicConjunctionExpression
                  : rangeExpression ( '&&' rangeExpression)*
                  ;

  @Description: Check logic expressions syntax positive examples.

  @Mode: run

  @Negative: no
*/

main() {
    var b = true
    var x = false
    let f = false

    // Rule:  prefixUnaryExpression = prefixUnaryOperator* incAndDecExpression
    x = b

    // Rule:  prefixUnaryExpression = prefixUnaryOperator* incAndDecExpression
    x = !b

    // Rule:  prefixUnaryExpression = prefixUnaryOperator* incAndDecExpression
    x = !!b

    // Rule: prefixUnaryOperator = '!' | ...
    x = !b

    // Rule:  logicDisjunctionExpression = logicConjunctionExpression ( '||' logicConjunctionExpression)*
    x = f || false

    // Rule:  logicDisjunctionExpression = logicConjunctionExpression ( '||' logicConjunctionExpression)*
    x = f || false || true

    // Rule:  logicDisjunctionExpression = logicConjunctionExpression ( '||' logicConjunctionExpression)*
    x = true && f || true && false

    // Rule:  logicConjunctionExpression = rangeExpression ( '&&' rangeExpression)*
    x = b && true

    // Rule:  logicConjunctionExpression = rangeExpression ( '&&' rangeExpression)*
    x = b && true && false
}

