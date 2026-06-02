/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a36_01

  @Level:         1

  @Assertion: 4.28(36) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description     Usage                Expression type

              ??        Right associative  coalescing      expr1 ?? expr2       The type of expr2
              |>        Left associative   Pipeline        expr1 |> expr2       The type of expr1 |> expr2 is the type
                                                                                of expr2(expr1)

  @Description: Check that '??' operator is right associative.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    let s1 = Option<String>.Some("hi")
    let s2 = Option<String>.Some("hello")

    let x1 = s1 ?? s2 ?? "choose wisely"
    let x2 = s1 ?? (s2 ?? "choose wisely")
    // NOTE: incorrect associativity '(s1 ?? s2) ?? "choose wisely"' causes a compilation error. Checked separately.
    Assert.isTrue(x1 == x2)
    return
}

