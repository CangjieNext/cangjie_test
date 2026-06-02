/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a02_01
  @Assertion:       func approxEquals(expected: Float32, actual: Float32, reason!: String = "")

  @Description:     Positive cases without exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.approxEquals(.0f32, .0)
    Assert.approxEquals(.0f32, .0, reason: "Must not fail")

    Assert.approxEquals(-0.0f32, .0)
    Assert.approxEquals(.0f32, -0.0, reason: "Must not fail1")

    Assert.approxEquals(1000.0f32, 1001.0)
    Assert.approxEquals(1001.0f32, 1000.0, reason: "Must not fail2")

    Assert.approxEquals(-1000.0f32, -1001.0)
    Assert.approxEquals(-1001.0f32, -1000.0, reason: "Must not fail3")

    Assert.approxEquals(123456789.0f32, 123456780.0)
    Assert.approxEquals(123456780.0f32, 123456789.0, reason: "Must not fail4")

    // inf / 1000 = inf
    Assert.approxEquals(Float32.Inf, .0)
    Assert.approxEquals(-Float32.Inf, .0, reason: "Must not fail5")

    Assert.approxEquals(Float32.Inf, Float32.Max)
    Assert.approxEquals(Float32.Inf, Float32.Min)
    Assert.approxEquals(-Float32.Inf, Float32.Max, reason: "Must not fail6")
    Assert.approxEquals(-Float32.Inf, Float32.Min, reason: "Must not fail7")

    // inf <= inf
    Assert.approxEquals(Float32.Inf, -Float32.Inf)
    Assert.approxEquals(-Float32.Inf, Float32.Inf, reason: "Must not fail8")
}
