/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a03_05

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
  @Description: Checks case of enumPattern
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

enum E { Foo(Int64) }

main() {
    var count = 0

    for (Foo(i) in [Foo(1), Foo(2)]) {
        for (Foo(i) in [Foo(1), Foo(2), Foo(3)] where i % 2 == 0) {
            count++
        }
    }

    Assert.equals(2, count)
}
