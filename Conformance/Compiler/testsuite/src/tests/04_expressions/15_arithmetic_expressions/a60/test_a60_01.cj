
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a60_01

  @Level:         1

  @Assertion:   4.15(60) x ** y = NaN // for finite x < 0.0 and finite y whose value is not equal to an integer
  @Description: Checks that x ** y = NaN for some (including random) float finite x < 0.0 and finite y whose value is 
                not equal to an integer. Checks that x ** (±Float64.Max) != NaN.
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
        var x : Float64
        do {
            x = -rnd.nextFloat64() * Float64(rnd.nextUInt64())
        } while (!x.isNormal() || x >= -0.0)

        var y : Float64
        do {
            y = rnd.nextFloat64() * Float64(rnd.nextInt64())
        } while (!y.isNormal() || floor(y) == y)

        Assert.isTrue((x ** y).isNaN())

        for (D in [-Float64.MinNormal, -Float64.MinDenormal, Float64.MinDenormal, Float64.MinNormal]) {
            Assert.isTrue((x ** D).isNaN())
        }

        for (D in [ -Float64.Max, Float64.Max ]) {
            Assert.isFalse((x ** D).isNaN())
        }

        for (D in [-Float64.Max, -Float64.MinNormal, -Float64.MinDenormal]) {
            Assert.isTrue((D ** y).isNaN())
        }
    }

    for (x in [-Float64.Max, -Float64.MinNormal, -Float64.MinDenormal]) {
        for (y in [ -Float64.Max, Float64.Max ]) {
            Assert.isFalse((x ** y).isNaN())
        }

        for (y in [-Float64.MinNormal, -Float64.MinDenormal, Float64.MinDenormal, Float64.MinNormal]) {
            Assert.isTrue((x ** y).isNaN())
        }
    }
}
