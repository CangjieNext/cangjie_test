
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a51_01

  @Level:         1

  @Assertion:   4.15(51) POSITIVE_INFINITY ** y = POSITIVE_INFINITY // for y > 0.0
  @Description: Checks that POSITIVE_INFINITY ** y = POSITIVE_INFINITY for some (including random) y > 0.0.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 0006075
*/

import utils.assert.Assert
import std.random.Random

main() {
    for (Y in [Float64.MinDenormal, Float64.MinNormal, Float64.Max, Float64.Inf]) {
        let res = Float64.Inf ** Y
        Assert.isTrue(res.isInf() && res > 0.0)
    }

    let rnd = Random(123)
    for (_ in 0..2**10) {
        var y : Float64
        do {
          y = rnd.nextFloat64() * Float64(rnd.nextUInt64())
        } while (y <= 0.0)
        let res = Float64.Inf ** y
        Assert.isTrue(res.isInf() && res > 0.0)
    }
}
