
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a47_01

  @Level:         1

  @Assertion:   4.15(47) x ** POSITIVE_INFINITY = POSITIVE_INFINITY // for any x < -1.0 or for any x > 1.0
  @Description: Checks that x ** POSITIVE_INFINITY = POSITIVE_INFINITY for random x < -1.0 or > 1.0.
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
        var x : Float64
        do {
          x = (rnd.nextFloat64() * 2.0 - 1.0) ** -1.0
        } while (!x.isNormal() || (x <= 1.0 && x >= -1.0))
        Assert.equals(Float64.Inf, x ** Float64.Inf)
    }
}