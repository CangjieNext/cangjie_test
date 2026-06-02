/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_07_a06_02
  @Assertion:       func approxEquals(expected: Float16, actual: Float16, tolerance: Float16, reason!: String = "")

  @Description:     Negative cases with exceptions: tolerance less than difference between numbers, negative tolerance,
                    NaN tolerance.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    checkExceptionThrow(100.0, 101.0, .0)
    checkExceptionThrow(101.0, 100.0, .0)
    checkExceptionThrow(100.0, 101.0, .1)
    checkExceptionThrow(101.0, 100.0, .1)

    checkExceptionThrow(-100.0, -101.0, .1)

    checkExceptionThrow(-100.0, 100.0, 199.0)
    checkExceptionThrow(100.0, -100.0, 199.0)

    checkExceptionThrow(99.0, 100.0, .999)
    checkExceptionThrow(100.0, 99.0, .999)

    checkExceptionThrow(1.1, 1.0, .01)
    checkExceptionThrow(1.0, 1.1, .01)

    checkExceptionThrow(.009, 90.0, 10.0)
    checkExceptionThrow(90.0, .009, 10.0)

    checkExceptionThrow(12349.0, 12340.0, 10.0)
    checkExceptionThrow(12340.0, 12349.0, 10.0)

    // inf - i = inf
    checkExceptionThrow(Float16.Inf, Float16.Max, Float16.Max)
    checkExceptionThrow(Float16.Max, Float16.Inf, Float16.Max)
    checkExceptionThrow(-Float16.Inf, Float16.Max, Float16.Max)
    checkExceptionThrow(Float16.Max, -Float16.Inf, Float16.Max)

    checkExceptionThrow(Float16.Inf, Float16.Min, Float16.Max)
    checkExceptionThrow(Float16.Min, Float16.Inf, Float16.Max)
    checkExceptionThrow(-Float16.Inf, Float16.Min, Float16.Max)
    checkExceptionThrow(Float16.Min, -Float16.Inf, Float16.Max)

    // inf - inf = NaN
    checkExceptionThrow(Float16.Inf, Float16.Inf, Float16.Inf)
    checkExceptionThrow(-Float16.Inf, -Float16.Inf, Float16.Inf)

    checkExceptionThrow(Float16.NaN, .0, Float16.Inf)
    checkExceptionThrow(.0, Float16.Inf, Float16.NaN)

    // Negative tolerance.
    checkExceptionThrow(100.0, 101.0, -0.1)
    checkExceptionThrow(101.0, 100.0, -0.1)

    checkExceptionThrow(100.0, 101.0, -Float16.MinNormal)
    checkExceptionThrow(100.0, 101.0, Float16.Min)
    checkExceptionThrow(100.0, 101.0, -Float16.Inf)
}

func checkExceptionThrow(var1: Float16, var2: Float16, tolerance: Float16) {
    try {
        Assert.approxEquals(var1, var2, tolerance)
        throw Exception("No expected exception")
    } catch (ok: AssertException) {}

    try {
        Assert.approxEquals(var1, var2, tolerance, reason: "Must fail")
        throw Exception("No expected exception1")
    } catch (ok: AssertException) {}
}
