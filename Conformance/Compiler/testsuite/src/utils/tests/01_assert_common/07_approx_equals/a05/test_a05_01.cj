/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a05_01
  @Assertion:       func approxEquals(expected: Float32, actual: Float32, tolerance: Float32, reason!: String = "")

  @Description:     Positive cases without exceptions: tolerance greater than or equal to the difference between
                    numbers, infinity tolerance.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.approxEquals(.0f32, .0, .0)
    Assert.approxEquals(.0f32, .0, -0.0, reason: "Must not fail")

    Assert.approxEquals(-0.0f32, .0, .0)
    Assert.approxEquals(.0f32, -0.0, -0.0, reason: "Must not fail1")

    Assert.approxEquals(-0.0f32, .0, Float32.MinNormal)

    Assert.approxEquals(1000.0f32, 1000.0, -0.0)

    Assert.approxEquals(1000.0f32, 1001.0, 1.0)
    Assert.approxEquals(1001.0f32, 1000.0, 1.0)
    Assert.approxEquals(1000.0f32, 1001.0, 1.000001, reason: "Must not fail2")

    Assert.approxEquals(-1000.0f32, -1001.0, 1.0)
    Assert.approxEquals(-1001.0f32, -1000.0, 1.000001, reason: "Must not fail3")

    Assert.approxEquals(100.0f32, -100.0, 200.0)
    Assert.approxEquals(-100.0f32, 100.0, 200.0001, reason: "Must not fail4")

    Assert.approxEquals(6.1f32, 6.09, .01)
    Assert.approxEquals(6.09f32, 6.1, .01, reason: "Must not fail5")

    Assert.approxEquals(.000009f32, 900000.0, 900000.0)
    Assert.approxEquals(900000.0f32, .000009, 900000.0, reason: "Must not fail6")

    Assert.approxEquals(123456789.0f32, 123456779.0, 100.0)
    Assert.approxEquals(123456779.0f32, 123456789.0, 100.0, reason: "Must not fail7")

    Assert.approxEquals(Float32.Max, Float32.MinNormal, Float32.Max)
    Assert.approxEquals(-Float32.MinNormal, Float32.Min, Float32.Max, reason: "Must not fail8")

    // Inf tolerance.
    Assert.approxEquals(Float32.Inf, Float32.Max, Float32.Inf)
    Assert.approxEquals(Float32.Inf, Float32.Min, Float32.Inf)
    Assert.approxEquals(-Float32.Inf, Float32.Max, Float32.Inf, reason: "Must not fail9")
    Assert.approxEquals(-Float32.Inf, Float32.Min, Float32.Inf, reason: "Must not fail10")

    Assert.approxEquals(Float32.Inf, .0, Float32.Inf)
    Assert.approxEquals(.0, Float32.Inf, Float32.Inf)
    Assert.approxEquals(-Float32.Inf, .0, Float32.Inf, reason: "Must not fail11")
    Assert.approxEquals(.0, -Float32.Inf, Float32.Inf, reason: "Must not fail12")

    Assert.approxEquals(Float32.Inf, -Float32.Inf, Float32.Inf)
    Assert.approxEquals(-Float32.Inf, Float32.Inf, Float32.Inf, reason: "Must not fail13")
}
