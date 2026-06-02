
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a12_01

  @Level:         1

  @Assertion:   4.20(12) main(): Int64 {
                    let expr1 = false
                    let expr2 = true
                    !true // Logical NOT, return false.
                    1 > 2 && expr1 // Logical AND, return false without computing the value of
                    expr1.↪
                    1 < 2 || expr2 // Logical OR, return true without computing the value of expr2.
                    return 0
                }
  @Description: Checks the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

var expr1Computed = false
var expr2Computed = false

func getExpr1() {
    expr1Computed = true
    true
}

func getExpr2() {
  expr2Computed = true
  false
}

main() {
    let expr1 = false
    let expr2 = true
    Assert.isFalse(!true) // Logical NOT, return false.
    Assert.isFalse(1 > 2 && expr1) // Logical AND, return false without computing the value of expr1.
    Assert.isFalse(expr1Computed)
    Assert.isTrue(1 < 2 || expr2) // Logical OR, return true without computing the value of expr2.
    Assert.isFalse(expr2Computed)
    return 0
}
