
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a11_01

  @Level:         1

  @Assertion:   4.20(11) Analogously, given an expression expr1 || expr2, expr2 is not evaluated if expr1 evaluates to
                true.
  @Description: Checks that for expr1 || expr2, expr2 is not evaluated if expr1 evaluates to true.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

var rhsEvaluated = false

func f() { true }

func g() {
    rhsEvaluated = true
    true
}

main() {
    f() || g()
    Assert.isFalse(rhsEvaluated)
}
