/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_18_a05_01

  @Level:         1

  @Assertion: 4.18(5)
              The syntax of bitwise expressions are defined as:

              prefixUnaryExpression
                  : prefixUnaryOperator* incAndDecExpression
                  ;

              prefixUnaryOperator
                  : '!'
                  | ...
                  ;

              bitwiseDisjunctionExpression
                  : bitwiseXorExpression ( '|' bitwiseXorExpression)*
                  ;

              bitwiseXorExpression
                  : bitwiseConjunctionExpression ( '^' bitwiseConjunctionExpression)*
                  ;

              bitwiseConjunctionExpression
                  : equalityComparisonExpression ( '&' equalityComparisonExpression)*
                  ;

              shiftingExpression
                  : additiveExpression (shiftingOperator additiveExpression)*
                  ;

              shiftingOperator
                  : '<<' | '>>'
                  ;

  @Description: Check bitwise expressions positive syntax examples.

  @Mode: run

  @Negative: no

  @Issue: 0006287 0006475 0006476
*/

main() {
    var x = 15
    var y = 0

    // Rule:  prefixUnaryExpression = prefixUnaryOperator* incAndDecExpression
    y = x

    // Rule:  prefixUnaryExpression = prefixUnaryOperator* incAndDecExpression
    y = !x

    // Rule:  prefixUnaryExpression = prefixUnaryOperator* incAndDecExpression
    y = !!x

    // Rule:  prefixUnaryOperator = '!' | ...
    y = !x

    // Rule:  prefixUnaryOperator = '!' | ...
    y = -x

    // Rule:  bitwiseDisjunctionExpression = bitwiseXorExpression ('|' bitwiseXorExpression)*
    y = x | 7

    // Rule:  bitwiseDisjunctionExpression = bitwiseXorExpression ('|' bitwiseXorExpression)*
    y = x | 7 | 15

    // Rule:  bitwiseDisjunctionExpression = bitwiseXorExpression ('|' bitwiseXorExpression)*
    y = x ^ 3 | x ^ 7

    // Rule:  bitwiseXorExpression = bitwiseConjunctionExpression ( '^' bitwiseConjunctionExpression)*
    y = x ^ 3

    // Rule:  bitwiseXorExpression = bitwiseConjunctionExpression ( '^' bitwiseConjunctionExpression)*
    y = x ^ 3 ^ 15

    // Rule:  bitwiseXorExpression = bitwiseConjunctionExpression ( '^' bitwiseConjunctionExpression)*
    y = x & 3 ^ x & 7

    // Rule:  bitwiseConjunctionExpression = equalityComparisonExpression ('&' equalityComparisonExpression)*
    y = x & 3

    // Rule:  bitwiseConjunctionExpression = equalityComparisonExpression ('&' equalityComparisonExpression)*
    y = x & 3 & 15

    // Rule:  shiftingExpression = additiveExpression (shiftingOperator additiveExpression)*
    y = x << 3
    y = x >> 3

    // Rule:  shiftingExpression = additiveExpression (shiftingOperator additiveExpression)*
    y = x << 1 << 2
    y = x >> 1 >> 2
    y = x << 1 >> 2

    // Rule: shiftingOperator = '<<' | '>>'
    y = x << 1

    // Rule: shiftingOperator = '<<' | '>>'
    y = x >> 1
}

