
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a52_01

  @Level:         1

  @Assertion:   4.15(52) NEGATIVE_INFINITY ** y = -0.0 // for finite y < 0.0 and its value is equal to an odd integer
  @Description: Checks that NEGATIVE_INFINITY ** Float64(n) = -0.0 for random odd n < 0.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6075,6320
*/

import utils.assert.Assert
import std.random.Random

main() {
    let rnd = Random(123)

    for (_ in 0..2**10) {
        let n = -2 * Int64(rnd.nextUInt64(UInt64(2**52))) - 1
        Assert.equals(-0.0, -Float64.Inf ** Float64(n))
    }
}
