/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a04_02
  @Assertion:       func approxEquals(expected: Float64, actual: Float64, tolerance: Float64, reason!: String = "")

  @Description:     Negative cases with exceptions: tolerance less than difference between numbers, negative tolerance,
                    NaN tolerance.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    checkExceptionThrow(10000.0, 10001.0, .0)
    checkExceptionThrow(10001.0, 10000.0, .0)
    checkExceptionThrow(10000.0, 10001.0, .1)
    checkExceptionThrow(10001.0, 10000.0, .1)

    checkExceptionThrow(-10000.0, -10001.0, .1)

    checkExceptionThrow(-100.0, 100.0, 199.0)
    checkExceptionThrow(100.0, -100.0, 199.0)

    checkExceptionThrow(99.0, 100.0, .99999999999999)
    checkExceptionThrow(100.0, 99.0, .99999999999999)

    checkExceptionThrow(6.1, 6.09, .001)
    checkExceptionThrow(6.09, 6.1, .001)

    checkExceptionThrow(.00000000000009, 90000000000.0, 100.0)
    checkExceptionThrow(90000000000.0, .00000000000009, 100.0)

    checkExceptionThrow(123456789012345679.0, 123456789012345670.0, 10.0)
    checkExceptionThrow(123456789012345670.0, 123456789012345679.0, 10.0)

    // inf - i = inf
    checkExceptionThrow(Float64.Inf, Float64.Max, Float64.Max)
    checkExceptionThrow(Float64.Max, Float64.Inf, Float64.Max)
    checkExceptionThrow(-Float64.Inf, Float64.Max, Float64.Max)
    checkExceptionThrow(Float64.Max, -Float64.Inf, Float64.Max)

    checkExceptionThrow(Float64.Inf, Float64.Min, Float64.Max)
    checkExceptionThrow(Float64.Min, Float64.Inf, Float64.Max)
    checkExceptionThrow(-Float64.Inf, Float64.Min, Float64.Max)
    checkExceptionThrow(Float64.Min, -Float64.Inf, Float64.Max)

    // inf - inf = NaN
    checkExceptionThrow(Float64.Inf, Float64.Inf, Float64.Inf)
    checkExceptionThrow(-Float64.Inf, -Float64.Inf, Float64.Inf)

    checkExceptionThrow(Float64.NaN, .0, Float64.Inf)
    checkExceptionThrow(.0, Float64.Inf, Float64.NaN)

    // Negative tolerance.
    checkExceptionThrow(10000.0, 10001.0, -0.1)
    checkExceptionThrow(10001.0, 10000.0, -0.1)

    checkExceptionThrow(10000.0, 10001.0, -Float64.MinNormal)
    checkExceptionThrow(10000.0, 10001.0, Float64.Min)
    checkExceptionThrow(10000.0, 10001.0, -Float64.Inf)
}

func checkExceptionThrow(var1: Float64, var2: Float64, tolerance: Float64) {
    try {
        Assert.approxEquals(var1, var2, tolerance)
        throw Exception("No expected exception")
    } catch (ok: AssertException) {}

    try {
        Assert.approxEquals(var1, var2, tolerance, reason: "Must fail")
        throw Exception("No expected exception1")
    } catch (ok: AssertException) {}
}
