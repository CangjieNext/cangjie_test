/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a01_01
  @Assertion:       func approxEquals(expected: Float64, actual: Float64, reason!: String = "")

  @Description:     Positive cases without exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.approxEquals(.0, .0)
    Assert.approxEquals(.0, .0, reason: "Must not fail")

    Assert.approxEquals(-0.0, .0)
    Assert.approxEquals(.0, -0.0, reason: "Must not fail1")

    Assert.approxEquals(10000.0, 10001.0)
    Assert.approxEquals(10001.0, 10000.0, reason: "Must not fail2")

    Assert.approxEquals(-10000.0, -10001.0)
    Assert.approxEquals(-10001.0, -10000.0, reason: "Must not fail3")

    Assert.approxEquals(123456789012345679.0, 123456789012345670.0)
    Assert.approxEquals(123456789012345670.0, 123456789012345679.0, reason: "Must not fail4")

    // inf / 10000 = inf
    Assert.approxEquals(Float64.Inf, .0)
    Assert.approxEquals(-Float64.Inf, .0, reason: "Must not fail5")

    Assert.approxEquals(Float64.Inf, Float64.Max)
    Assert.approxEquals(Float64.Inf, Float64.Min)
    Assert.approxEquals(-Float64.Inf, Float64.Max, reason: "Must not fail6")
    Assert.approxEquals(-Float64.Inf, Float64.Min, reason: "Must not fail7")

    // inf <= inf
    Assert.approxEquals(Float64.Inf, -Float64.Inf)
    Assert.approxEquals(-Float64.Inf, Float64.Inf, reason: "Must not fail8")
}
