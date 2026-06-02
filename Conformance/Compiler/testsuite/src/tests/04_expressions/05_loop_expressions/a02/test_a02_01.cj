/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_a02_01

  @Level:         1

  @Assertion: 4.5(2) Note that the value of a loop expression is Unit.
  @Description: Checks values of all kinds of loop expressions
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

main() {
    var count = 0

    // for-in loop
    Assert.isTrue(
        for (x in [1,2]) {
            count++
        } is Unit)

    // do while loop
    Assert.isTrue(
        do {
            count++
        } while (count < 5) is Unit)

    // while loop
    Assert.isTrue(
       while (count < 10) {
           count++
        } is Unit)

    // while-let loop
    var opt = Some(1)

    Assert.isTrue(
       while (let Some(x) <- opt) {
           if (x < 5) {
               opt = x + 1
           } else {
               opt = None
           }
        } is Unit)
}
