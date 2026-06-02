
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_02_a02_01

  @Level:         1

  @Assertion:   4.7.2(2) It stops the current iteration of the nearest loop expression and then starts a new iteration
                from the beginning of the loop expression.
  @Description: Checks that continue skips to the next iteration of the loop for all kinds of loop expressions.
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
        if (i == 5) {
            continue
        }
        i++
    }
    Assert.equals(5, i)
    Assert.notEquals(10, i)

    i = 0
    var j = 0
    while (i < 10) {
        i++
        if (i == 5) {
            continue
        }
        j++
    }
    Assert.equals(9, j)
    Assert.notEquals(10, j)

    i = 0
    j = 0
    do {
        i++
        if (i == 5) {
            continue
        }
        j++
    } while (i < 10)
    Assert.equals(9, j)
    Assert.notEquals(10, j)
}
