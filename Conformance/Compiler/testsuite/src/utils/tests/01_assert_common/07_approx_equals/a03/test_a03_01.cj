/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a03_01
  @Assertion:       func approxEquals(expected: Float16, actual: Float16, reason!: String = "")

  @Description:     Positive cases without exceptions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.approxEquals(.0f16, .0)
    Assert.approxEquals(.0f16, .0, reason: "Must not fail")

    Assert.approxEquals(-0.0f16, .0)
    Assert.approxEquals(.0f16, -0.0, reason: "Must not fail1")

    Assert.approxEquals(1000.0f16, 1001.0)
    Assert.approxEquals(1001.0f16, 1000.0, reason: "Must not fail2")

    Assert.approxEquals(-1000.0f16, -1001.0)
    Assert.approxEquals(-1001.0f16, -1000.0, reason: "Must not fail3")

    Assert.approxEquals(12349.0f16, 12340.0)
    Assert.approxEquals(12340.0f16, 12349.0, reason: "Must not fail4")

    // inf / 100 = inf
    Assert.approxEquals(Float16.Inf, .0)
    Assert.approxEquals(-Float16.Inf, .0, reason: "Must not fail5")

    Assert.approxEquals(Float16.Inf, Float16.Max)
    Assert.approxEquals(Float16.Inf, Float16.Min)
    Assert.approxEquals(-Float16.Inf, Float16.Max, reason: "Must not fail6")
    Assert.approxEquals(-Float16.Inf, Float16.Min, reason: "Must not fail7")

    // inf <= inf
    Assert.approxEquals(Float16.Inf, -Float16.Inf)
    Assert.approxEquals(-Float16.Inf, Float16.Inf, reason: "Must not fail8")
}
