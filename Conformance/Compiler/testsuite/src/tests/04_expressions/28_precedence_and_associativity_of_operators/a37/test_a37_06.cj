/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a37_06

  @Level:         1

  @Assertion: 4.28(37) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description     Usage                Expression type

              |>        Left associative   Pipeline        expr1 |> expr2       The type of expr1 |> expr2 is the type
                                                                                of expr2(expr1)
              ~>        Left associative   Composition     expr1 ~> expr2       The type of expr1 ~> expr2 is the type
                                                                                of the lambda expression
                                                                                {x=>expr2(expr1(x))}
              =         None               Assignment      leftValue = expr     Unit

  @Description: Check that '|>' operator is left associative with '~>' operator with the same precedence.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func adder(x: Int64) {
    return { i: Int64 => i + x }
}

func mul2(x: Int64) {
    return x * 2
}

main() {
    let f = 3 |> adder ~> mul2
    let g = (3 |> adder) ~> mul2

    Assert.equals(8, f(1))
    Assert.equals(8, g(1))

    // NOTE: incorrect associativity "3 |> (adder ~> mul2)" leads to a compilation error. Checked separately.

    return
}

