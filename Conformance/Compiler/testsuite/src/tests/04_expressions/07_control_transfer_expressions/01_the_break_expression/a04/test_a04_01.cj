
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_01_a04_01

  @Level:         1

  @Assertion:   4.7.1(4) Note that when a break expression appears in a nested loop expression, only the immediate
                containing loop expression is terminated, and the other loop expressions are not affected. 
  @Description: Checks that only the loop containing the break statement is terminated and not the enclosing one for
                various combinations of two nested loops. 
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
        for (_ in 0..10) {
            i++
            if (i % 5 == 0) {
                break
            }
        }
    }
    Assert.equals(50, i)

    i = 0
    for (_ in 0..10) {
        while (true) {
            i++
            if (i % 5 == 0) {
                break
            }
        }
    }
    Assert.equals(50, i)

    i = 0
    for (_ in 0..10) {
        do {
            i++
            if (i % 5 == 0) {
                break
            }
        } while (true)
    }
    Assert.equals(50, i)

    i = 0
    while (i < 50) {
        for (_ in 0..10) {
            i++
            if (i % 5 == 0) {
                break
            }
        }
    }
    Assert.equals(50, i)

    i = 0
    while (i < 50) {
        while (true) {
            i++
            if (i % 5 == 0) {
                break
            }
        }
    }
    Assert.equals(50, i)

    i = 0
    while (i < 50) {
        do {
            i++
            if (i % 5 == 0) {
                break
            }
        } while (true)
    }
    Assert.equals(50, i)

    i = 0
    do {
        for (_ in 0..10) {
            i++
            if (i % 5 == 0) {
                break
            }
        }
    } while (i < 50)
    Assert.equals(50, i)

    i = 0
    do {
        while (true) {
            i++
            if (i % 5 == 0) {
                break
            }
        }
    } while (i < 50)
    Assert.equals(50, i)

    i = 0
    do {
        do {
            i++
            if (i % 5 == 0) {
                break
            }
        } while (true)
    } while (i < 50)
    Assert.equals(50, i)
}
