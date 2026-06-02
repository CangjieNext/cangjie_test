
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_a02_10

  @Level:         1

  @Assertion:   4.17(2) The syntax of type test and type cast expressions is defined as:
                comparisonOrTypeExpression
                    : ...
                    | shiftingExpression ('is' type)?
                    | shiftingExpression ('as' userType)?
                    ;
  @Description: Check that arguments cannot be switched places for `as` operator. 
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    Int64 as 1
}
