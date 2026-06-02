/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a01_01

  @Level:         1

  @Assertion: 4.13.1(1) The syntax of a member access expression is defined as the rule 3 of the syntax of the postfix
              expression above.

              postfixExpression '.' identifier typeArguments?

  @Description: Check usage of member access expressions.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct S {
    S(var x!: Int64) {}

    func genFun<T>(t: T) {
        return t
    }
}

func makeS(x: Int64) {
    return S(x: x)
}

main() {
    // postfixExpression '.' identifer typeArguments?
    //
    // Case: no type arguments.
    let q = makeS(53).x
    Assert.equals(53, q)

    // postfixExpression '.' identifer typeArguments?
    //
    // Case: type arguments present.
    let s = makeS(53)
    let r = s.genFun<String>
    Assert.isTrue(r is (String) -> String)
}

