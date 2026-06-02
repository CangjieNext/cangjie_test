/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a03_03

  @Level:         1

  @Assertion: 4.5.1(3) The syntax of the for-in expression is defined as follows.
              forInExpression
                  : 'for' '(' patternsMaybeIrrefutable 'in' expression patternGuard? ')' block
                  ;

              patternsMaybeIrrefutable
                  : wildcardPattern
                  | varBindingPattern
                  | tuplePattern
                  | enumPattern
                  ;

              patternGuard
                  : 'where' expression
                  ;
  @Description: Checks case of varBindingPattern
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

main() {
    var count = 0

    for (i in 1..=2) {
        for (i in 1..=3 where i % 2 == 0) {
            count++
        }
    }

    Assert.equals(2, count)
}
