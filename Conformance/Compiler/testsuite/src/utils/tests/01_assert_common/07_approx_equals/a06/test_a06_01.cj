/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a06_01
  @Assertion:       func approxEquals(expected: Float16, actual: Float16, tolerance: Float16, reason!: String = "")

  @Description:     Positive cases without exceptions: tolerance greater than or equal to the difference between
                    numbers, infinity tolerance.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.approxEquals(.0f16, .0, .0)
    Assert.approxEquals(.0f16, .0, -0.0, reason: "Must not fail")

    Assert.approxEquals(-0.0f16, .0, .0)
    Assert.approxEquals(.0f16, -0.0, -0.0, reason: "Must not fail1")

    Assert.approxEquals(-0.0f16, .0, Float16.MinNormal)

    Assert.approxEquals(100.0f16, 100.0, -0.0)

    Assert.approxEquals(100.0f16, 101.0, 1.0)
    Assert.approxEquals(101.0f16, 100.0, 1.0)
    Assert.approxEquals(100.0f16, 101.0, 1.01, reason: "Must not fail2")

    Assert.approxEquals(-100.0f16, -101.0, 1.0)
    Assert.approxEquals(-101.0f16, -100.0, 1.01, reason: "Must not fail3")

    Assert.approxEquals(100.0f16, -100.0, 200.0)
    Assert.approxEquals(-100.0f16, 100.0, 200.1, reason: "Must not fail4")

    Assert.approxEquals(1.1f16, 1.0, .1)
    Assert.approxEquals(1.0f16, 1.1, .1, reason: "Must not fail5")

    Assert.approxEquals(.009f16, 90.0, 90.0)
    Assert.approxEquals(90.0f16, .009, 90.0, reason: "Must not fail6")

    Assert.approxEquals(12349.0f16, 12340.0, 100.0)
    Assert.approxEquals(12340.0f16, 12349.0, 100.0, reason: "Must not fail7")

    Assert.approxEquals(Float16.Max, Float16.MinNormal, Float16.Max)
    Assert.approxEquals(-Float16.MinNormal, Float16.Min, Float16.Max, reason: "Must not fail8")

    // Inf tolerance.
    Assert.approxEquals(Float16.Inf, Float16.Max, Float16.Inf)
    Assert.approxEquals(Float16.Inf, Float16.Min, Float16.Inf)
    Assert.approxEquals(-Float16.Inf, Float16.Max, Float16.Inf, reason: "Must not fail9")
    Assert.approxEquals(-Float16.Inf, Float16.Min, Float16.Inf, reason: "Must not fail10")

    Assert.approxEquals(Float16.Inf, .0, Float16.Inf)
    Assert.approxEquals(.0, Float16.Inf, Float16.Inf)
    Assert.approxEquals(-Float16.Inf, .0, Float16.Inf, reason: "Must not fail11")
    Assert.approxEquals(.0, -Float16.Inf, Float16.Inf, reason: "Must not fail12")

    Assert.approxEquals(Float16.Inf, -Float16.Inf, Float16.Inf)
    Assert.approxEquals(-Float16.Inf, Float16.Inf, Float16.Inf, reason: "Must not fail13")
}
