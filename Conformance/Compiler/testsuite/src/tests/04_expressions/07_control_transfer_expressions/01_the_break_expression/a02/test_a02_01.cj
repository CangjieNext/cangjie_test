
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_01_a02_01

  @Level:         1

  @Assertion:   4.7.1(2) It immediately ends the evaluation of the loop and transfers the control to the end of the
                loop expression.
  @Description: Checks that break interrupts the loop for all kinds of loop expressions. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var i : Int64

    i = 0
    for (_ in 0..10) {
        i++
        if (i == 5) {
            break
        }
    }
    Assert.equals(5, i)
    Assert.notEquals(10, i)

    i = 0
    while (i < 10) {
        if (i == 5) {
            break
        }
        i++
    }
    Assert.equals(5, i)
    Assert.notEquals(10, i)

    i = 0
    do {
        if (i == 5) {
            break
        }
        i++
    } while (i < 10)
    Assert.equals(5, i)
    Assert.notEquals(10, i)
}
