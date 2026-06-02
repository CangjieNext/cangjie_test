/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_a04_08

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

  @Description: Check that postfix expressions "identifier callSuffix? trailingLambdaExpression"
                without required call suffix causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

struct S {
    func invoke(arg: Int64, fn: (Int64) -> Int64) {
        return fn(arg)
    }
}

main() {
    let s = S()
    let x = s.invoke { i => i * i }
}

