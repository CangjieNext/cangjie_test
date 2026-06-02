
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a09_03

  @Level:         1

  @Assertion:   4.7(9) The enclosing loops cannot cross function boundaries.
  @Description: Checks that enclosing do-while loop does not cross function boundaries.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

main() {
    var k = 0
    do {
        func f() {
            var k = 1
            for (j in 0..10) {
                k *= 100
                break
            }
            Assert.equals(100, k)
        }
        f()
        k++
    } while (k < 10)
    Assert.equals(10, k)
}