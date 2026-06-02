
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a56_01

  @Level:         1

  @Assertion:   4.15(56) 0.0 ** y = POSITIVE_INFINITY // for finite y < 0.0 and its value is not equal to an odd
                integer
  @Description: Checks that 0.0 ** y = POSITIVE_INFINITY for some (including random) float y < 0, which is not equal
                to an odd integer.
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

    for (_ in 0..2**10) {
        var y : Float64
        do {
            y = -rnd.nextFloat64() * Float64(rnd.nextUInt64())
        } while (!y.isNormal() || y >= -0.0 || floor(y) == y)
        let n = -2 * Int64(1 + rnd.nextUInt64(UInt64(2**52)-1))
        let resY = 0.0 ** y
        let resN = 0.0 ** Float64(n)
        Assert.isTrue(resY.isInf() && resY > 0.0)
        Assert.isTrue(resN.isInf() && resN > 0.0)
    }

    for (y in [-Float64.Max, -Float64.MinNormal, -Float64.MinDenormal]) {
        let res = -0.0 ** y
        Assert.isTrue(res.isInf() && res > 0.0)
    }
}
