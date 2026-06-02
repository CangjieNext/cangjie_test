/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_a01_01

  @Level:         1

  @Assertion: 4.5(1) There are three kinds of loop expressions in the Cangjie programming language,
              i.e., the for-in expression, the while expression and the do-while expression.
  @Description: Check some example for three kinds of loops.
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

// Find last Pythagorean triplet below limit

func testFor(n: Int64) {
    var t = (0, 0, 0)
    for (i in 1 ..= n) {
        for (j in i + 1 ..= n) {
            for (k in j + 1 ..= n) {
                if (i ** 2 + j ** 2 == k ** 2) {
                    t = (i, j, k)
                }
            }
        }
    }
    return t
}

func testWhile(n: Int64) {
    var t = (0, 0, 0)
    var i = 1
    while (i <= n) {
        var j = i + 1
        while (j <= n) {
            var k = j + 1
            while (k <= n) {
                if (i ** 2 + j ** 2 == k ** 2) {
                    t = (i, j, k)
                }
                k++
            }
            j++
        }
        i++
    }
    return t
}

func testDoWhile(n: Int64) {
    var t = (0, 0, 0)
    var i = 1
    do {
        var j = i + 1
        do {
            var k = j + 1
            do {
                if (i ** 2 + j ** 2 == k ** 2) {
                    t = (i, j, k)
                }
                k++
            } while (k <= n)
            j++
        } while (j <= n)
        i++
    } while (i <= n)
    return t
}

main() {
    Assert.isTrue(testFor(10) == (6, 8, 10))
    Assert.isTrue(testWhile(10) == (6, 8, 10))
    Assert.isTrue(testDoWhile(10) == (6, 8, 10))
}
