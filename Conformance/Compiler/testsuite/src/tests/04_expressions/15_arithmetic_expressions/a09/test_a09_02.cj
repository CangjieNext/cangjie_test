
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a09_02

  @Level:         1

  @Assertion:   4.15(9) In particular, the behavior of the division operator(/) on integer types is rounding
                non-integral values towards 0.
  @Description: Checks for random set of Int16 pairs (a, b) that |a/b*b| <= |a|.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert
import std.random.Random
import std.math.*

main() {
    let rnd = Random(123)
    for (i in 0..2**10) {
        let a = rnd.nextInt16()
        var b : Int16 = 0
        while (b == 0) {
            b = rnd.nextInt16()
        }
        if (a != Int16.Min) {
            Assert.isTrue(abs(a / b * b) <= abs(a))
        }
    }
}
