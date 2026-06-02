/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a05_02
  @Assertion:       func approxEquals(expected: Float32, actual: Float32, tolerance: Float32, reason!: String = "")

  @Description:     Negative cases with exceptions: tolerance less than difference between numbers, negative tolerance,
                    NaN tolerance.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    checkExceptionThrow(1000.0, 1001.0, .0)
    checkExceptionThrow(1001.0, 1000.0, .0)
    checkExceptionThrow(1000.0, 1001.0, .1)
    checkExceptionThrow(1001.0, 1000.0, .1)

    checkExceptionThrow(-1000.0, -1001.0, .1)

    checkExceptionThrow(-100.0, 100.0, 199.0)
    checkExceptionThrow(100.0, -100.0, 199.0)

    checkExceptionThrow(99.0, 100.0, .999999)
    checkExceptionThrow(100.0, 99.0, .999999)

    checkExceptionThrow(6.1, 6.09, .001)
    checkExceptionThrow(6.09, 6.1, .001)

    checkExceptionThrow(.000009, 900000.0, 100.0)
    checkExceptionThrow(900000.0, .000009, 100.0)

    checkExceptionThrow(123456789.0, 123456779.0, 10.0)
    checkExceptionThrow(123456779.0, 123456789.0, 10.0)

    // inf - i = inf
    checkExceptionThrow(Float32.Inf, Float32.Max, Float32.Max)
    checkExceptionThrow(Float32.Max, Float32.Inf, Float32.Max)
    checkExceptionThrow(-Float32.Inf, Float32.Max, Float32.Max)
    checkExceptionThrow(Float32.Max, -Float32.Inf, Float32.Max)

    checkExceptionThrow(Float32.Inf, Float32.Min, Float32.Max)
    checkExceptionThrow(Float32.Min, Float32.Inf, Float32.Max)
    checkExceptionThrow(-Float32.Inf, Float32.Min, Float32.Max)
    checkExceptionThrow(Float32.Min, -Float32.Inf, Float32.Max)

    // inf - inf = NaN
    checkExceptionThrow(Float32.Inf, Float32.Inf, Float32.Inf)
    checkExceptionThrow(-Float32.Inf, -Float32.Inf, Float32.Inf)

    checkExceptionThrow(Float32.NaN, .0, Float32.Inf)
    checkExceptionThrow(.0, Float32.Inf, Float32.NaN)

    // Negative tolerance.
    checkExceptionThrow(1000.0, 1001.0, -0.1)
    checkExceptionThrow(1001.0, 1000.0, -0.1)

    checkExceptionThrow(1000.0, 1001.0, -Float32.MinNormal)
    checkExceptionThrow(1000.0, 1001.0, Float32.Min)
    checkExceptionThrow(1000.0, 1001.0, -Float32.Inf)
}

func checkExceptionThrow(var1: Float32, var2: Float32, tolerance: Float32) {
    try {
        Assert.approxEquals(var1, var2, tolerance)
        throw Exception("No expected exception")
    } catch (ok: AssertException) {}

    try {
        Assert.approxEquals(var1, var2, tolerance, reason: "Must fail")
        throw Exception("No expected exception1")
    } catch (ok: AssertException) {}
}
