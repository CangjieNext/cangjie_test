/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a01_02

  @Level:         1

  @Assertion: 4.13.1(1) The syntax of a member access expression is defined as the rule 3 of the syntax of the postfix
              expression above.

              postfixExpression '.' identifier typeArguments?

  @Description: Check that postfix expressions "postfixExpression '.' identifier typeArguments?" without '.' causes a
                compilation error.

  @Mode: compileonly

  @Negative: yes

*/

struct S {
    S(var x!: Int64) {}
}

func makeS() {
    return S(x: 42)
}

main() {
    makeS() x
    return
}

