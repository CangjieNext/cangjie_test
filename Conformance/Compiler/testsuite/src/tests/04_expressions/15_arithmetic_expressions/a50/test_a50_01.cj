
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a50_01

  @Level:         1

  @Assertion:   4.15(50) POSITIVE_INFINITY ** y = 0.0 // for y < 0.0
  @Description: Checks that POSITIVE_INFINITY ** y = 0.0 for random y < 0.0.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 0006075
*/

import utils.assert.Assert
import std.random.Random

main() {
    let rnd = Random(123)

    for (_ in 0..2**10) {
        var y : Float64
        do {
          y = -rnd.nextFloat64() * Float64(rnd.nextUInt64())
        } while (y >= -0.0)
        Assert.equals(0.0, Float64.Inf ** y)
    }
}