/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a01_07

  @Level:         1

  @Assertion:    3.2.3.2(1) Names defined inside a function definition or an expression have local-level scope.

  @Description:  Checks that variables defined in loop expressions have local-level scope.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var i = 0
    var sum = 0

    for (i in 1..5) {
        sum += i
    }
    Assert.equals(10, sum)
    Assert.equals(0, i)

    for (i in 1..3) {
        var sum = 20
        if (i == 2) {
          Assert.equals(20, sum)
        }
    }
    Assert.equals(10, sum)

    while (i < 3) {
        var sum = 30
        if (i == 2) {
          Assert.equals(30, sum)
        }
        i += 1

    }
    Assert.equals(10, sum)

    i = 0
    do {
        var sum = 40
        if (i == 2) {
          Assert.equals(40, sum)
        }
        i += 1
    } while (i < 3)

    Assert.equals(10, sum)
}
