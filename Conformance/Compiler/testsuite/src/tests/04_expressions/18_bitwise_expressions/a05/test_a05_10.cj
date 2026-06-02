/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_18_a05_10

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

  @Description: Check that bitwise expression without the second expression with '^' causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

main() {
    var x = 15
    x ^;
    return
}

