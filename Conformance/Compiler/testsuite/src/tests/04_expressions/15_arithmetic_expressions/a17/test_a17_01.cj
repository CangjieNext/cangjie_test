
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a17_01

  @Level:         1

  @Assertion:   4.15(17) x ** 0 = 1.0 // for any x
  @Description: Checks for some (including random) float numbers x that x ** 0 = 1.0
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 0006075
*/

import utils.assert.Assert
import std.random.Random

main() {
    for (D in [Float64.NaN, -Float64.Inf, -Float64.Max, -Float64.MinNormal, -Float64.MinDenormal, -0.0,
             0.0, Float64.MinDenormal, Float64.MinNormal, Float64.Max, Float64.Inf]) {
        let R = D ** 0
        Assert.equals(1.0, R)
    }

    let rnd = Random(123)
    for (_ in 0..2**10) {
        let x = rnd.nextFloat64() * Float64(rnd.nextInt64())
        Assert.equals(1.0, x**0)
    }
}
