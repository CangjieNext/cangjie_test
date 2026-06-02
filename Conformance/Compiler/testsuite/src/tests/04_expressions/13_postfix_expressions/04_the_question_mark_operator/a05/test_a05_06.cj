/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a05_06

  @Level:         1

  @Assertion: 4.13.4(5) The syntax of an optional chaining is defined as the last rule of the syntax of
              the postfix expression
              above, where the syntax of questSeperatedItems is defined as follows:

              questSeperatedItems
                  : questSeperatedItem+
                  ;

              questSeperatedItem
                  : itemAfterQuest (callSuffix | callSuffix? trailingLambdaExpression | indexAccess)?
                  ;

              itemAfterQuest
                  : '.' identifier typeArguments?
                  | callSuffix
                  | indexAccess
                  | trailingLambdaExpression
                  ;

  @Description: Check that itemAfterQuest = "'.' identifer typeArguments?" rule without required identifier causes
                a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

struct S {
    var x: Int64 = 0
}

main() {
    var s: ?S = S()
    let y = s?.
    return
}
