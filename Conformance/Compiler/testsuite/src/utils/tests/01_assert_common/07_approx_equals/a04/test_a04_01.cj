/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a04_01
  @Assertion:       func approxEquals(expected: Float64, actual: Float64, tolerance: Float64, reason!: String = "")

  @Description:     Positive cases without exceptions: tolerance greater than or equal to the difference between
                    numbers, infinity tolerance.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.approxEquals(.0, .0, .0)
    Assert.approxEquals(.0, .0, -0.0, reason: "Must not fail")

    Assert.approxEquals(-0.0, .0, .0)
    Assert.approxEquals(.0, -0.0, -0.0, reason: "Must not fail1")

    Assert.approxEquals(-0.0, .0, Float64.MinNormal)

    Assert.approxEquals(10000.0, 10000.0, -0.0)

    Assert.approxEquals(10000.0, 10001.0, 1.0)
    Assert.approxEquals(10001.0, 10000.0, 1.0)
    Assert.approxEquals(10000.0, 10001.0, 1.00000000000001, reason: "Must not fail2")

    Assert.approxEquals(-10000.0, -10001.0, 1.0)
    Assert.approxEquals(-10001.0, -10000.0, 1.00000000000001, reason: "Must not fail3")

    Assert.approxEquals(100.0, -100.0, 200.0)
    Assert.approxEquals(-100.0, 100.0, 200.000000000001, reason: "Must not fail4")

    Assert.approxEquals(6.1, 6.09, .01)
    Assert.approxEquals(6.09, 6.1, .01, reason: "Must not fail5")

    Assert.approxEquals(.00000000000009, 90000000000.0, 90000000000.0)
    Assert.approxEquals(90000000000.0, .00000000000009, 90000000000.0, reason: "Must not fail6")

    Assert.approxEquals(123456789012345679.0, 123456789012345670.0, 100.0)
    Assert.approxEquals(123456789012345670.0, 123456789012345679.0, 100.0, reason: "Must not fail7")

    Assert.approxEquals(Float64.Max, Float64.MinNormal, Float64.Max)
    Assert.approxEquals(-Float64.MinNormal, Float64.Min, Float64.Max, reason: "Must not fail8")

    // Inf tolerance.
    Assert.approxEquals(Float64.Inf, Float64.Max, Float64.Inf)
    Assert.approxEquals(Float64.Inf, Float64.Min, Float64.Inf)
    Assert.approxEquals(-Float64.Inf, Float64.Max, Float64.Inf, reason: "Must not fail9")
    Assert.approxEquals(-Float64.Inf, Float64.Min, Float64.Inf, reason: "Must not fail10")

    Assert.approxEquals(Float64.Inf, .0, Float64.Inf)
    Assert.approxEquals(.0, Float64.Inf, Float64.Inf)
    Assert.approxEquals(-Float64.Inf, .0, Float64.Inf, reason: "Must not fail11")
    Assert.approxEquals(.0, -Float64.Inf, Float64.Inf, reason: "Must not fail12")

    Assert.approxEquals(Float64.Inf, -Float64.Inf, Float64.Inf)
    Assert.approxEquals(-Float64.Inf, Float64.Inf, Float64.Inf, reason: "Must not fail13")
}
