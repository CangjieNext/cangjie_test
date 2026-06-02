
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a10_01

  @Level:         1

  @Assertion:   4.20(10) The short-circuit evaluation strategy is adopted for && and ||, i.e., given an expression
                expr1 && expr2, if expr1 evaluates to false, expr2 is not evaluated.
  @Description: Checks that in expr1 && expr2, if expr1 evaluates to false, expr2 is not evaluated.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

var rhsEvaluated = false

func f() { false }

func g() {
    rhsEvaluated = true
    true
}

main() {
    f() && g()
    Assert.isFalse(rhsEvaluated)
}
