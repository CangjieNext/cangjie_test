/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a01_02
  @Assertion:       func approxEquals(expected: Float64, actual: Float64, reason!: String = "")

  @Description:     Negative cases with exceptions: small numbers, NaNs.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    checkExceptionThrow(100.0, 101.0)
    checkExceptionThrow(101.0, 100.0)

    checkExceptionThrow(1.0, 100.0)
    checkExceptionThrow(100.0, 1.0)

    // min double > 0 / 10000
    checkExceptionThrow(.0, Float64.MinNormal)
    checkExceptionThrow(-0.0, Float64.MinNormal)

    checkExceptionThrow(.0, -Float64.MinNormal)
    checkExceptionThrow(-0.0, -Float64.MinNormal)

    // inf - inf = NaN
    checkExceptionThrow(Float64.Inf, Float64.Inf)
    checkExceptionThrow(-Float64.Inf, -Float64.Inf)

    checkExceptionThrow(Float64.NaN, .0)
    checkExceptionThrow(.0, Float64.NaN)
}

func checkExceptionThrow(var1: Float64, var2: Float64) {
    try {
        Assert.approxEquals(var1, var2)
        throw Exception("No expected exception")
    } catch (ok: AssertException) {}

    try {
        Assert.approxEquals(var1, var2, reason: "Must fail")
        throw Exception("No expected exception1")
    } catch (ok: AssertException) {}
}
