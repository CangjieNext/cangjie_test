/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_22_a03_02

  @Level:         1

  @Assertion: 4.22(3)
              The syntax of flow expression is defined as follows:

              flowExpression
                  : logicDisjunctionExpression (flowOperator logicDisjunctionExpression)*
                  ;

              flowOperator
                  : '|>' | '~>'
                  ;

  @Description: Check that missing required the first logicDisjunctionExpression for |> causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

func sqr(x: Int64) {
    x * x
}

main() {
    |> sqr;
}

