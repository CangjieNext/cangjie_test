/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a02_09

  @Level:         1

  @Assertion:    3.2.4(2) Note that shadowing ends when the lower-scope ends.

  @Description:  Check different kinds of scopes.
                 Check that outer local-scope is used when inner local-scope ends. Loop expressions.

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main() {
    var i = 0
    var a = "a"
    var b = "b"

    for (i in 1..3) {
        Assert.isTrue(i > 0)
    }

    Assert.equals(0, i)

    for ((a,b) in [(1,1), (2,2)]) {
        Assert.isTrue(a > 0)
    }

    Assert.equals("ab", a+b)

    var sum: Int64

    i = 0
    sum = 0
    while (i < 5) {
        if (true) {
            var i = 10
            i += 10
        }

        sum += 1
        i += 1
    }

    Assert.equals(5, sum)

    i = 0
    sum = 0
    do {
        if (true) {
            var i = 10
            i += 10
        }

        sum += 1
        i += 1
    } while (i < 5)

    Assert.equals(5, sum)
}
