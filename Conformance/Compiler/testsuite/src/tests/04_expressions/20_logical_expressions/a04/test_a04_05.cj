/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_20_a04_05

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

  @Description: Check that logic expression without the second required expression with &&
                causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

main() {
    var b1 = true
    b1 &&;
    reeturn;
}

