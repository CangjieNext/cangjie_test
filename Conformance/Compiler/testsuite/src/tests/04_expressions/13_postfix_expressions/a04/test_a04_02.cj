/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_a04_02

  @Level:         1

  @Assertion: 4.13(4) The syntax of the postfix expression is defined as.

              postfixExpression
                  : atomicExpression
                  | type '.' identifier
                  | postfixExpression '.' identifier typeArguments?
                  | postfixExpression callSuffix
                  | postfixExpression indexAccess
                  | postfixExpression '.' identifier callSuffix? trailingLambdaExpression
                  | identifier callSuffix? trailingLambdaExpression
                  | postfixExpression ('?' questSeperatedItems)+
                  ;

  @Description: Check that postfix expressions "type '.' identifier" without '.' causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

interface I {
    static func foo() {
        return 42
    }
}

main() {
    let f = I foo
}

