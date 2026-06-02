/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a03_01

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
  @Description: Checks that pattern can not be omitted
  @Mode: compileonly
  @Negative: yes

*/

main() {
    for () { println("wrong") }
}
