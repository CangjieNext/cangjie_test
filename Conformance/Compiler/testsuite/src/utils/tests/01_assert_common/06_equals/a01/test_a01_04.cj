/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_06_a01_04
  @Assertion:       func equals<T>(expected: T, actual: T, reason!: String = "")

  @Description:     NaN test cases.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    checkExceptionThrow(Float64.NaN, .0)
    checkExceptionThrow(Float32.NaN, .0)
    checkExceptionThrow(Float16.NaN, .0)

    checkExceptionThrow(Float64.NaN, Float64.Inf)
    checkExceptionThrow(Float32.NaN, Float32.Inf)
    checkExceptionThrow(Float16.NaN, Float16.Inf)

    Assert.equals(Float64.NaN, Float64.NaN)
    Assert.equals(Float32.NaN, Float32.NaN)
    Assert.equals(Float16.NaN, Float16.NaN)

    Assert.equals(.0/.0, .0/.0)
    Assert.equals(.0f32/.0, .0f32/.0)
    Assert.equals(.0f16/.0, .0f16/.0)

    Assert.equals(Float64.NaN, .0/.0)
    Assert.equals(Float32.NaN, .0f32/.0)
    Assert.equals(Float16.NaN, .0f16/.0)
}

func checkExceptionThrow<T>(var1: T, var2: T) where T <: Equatable<T> {
    try {
        Assert.equals(var1, var2)
        throw Exception("No expected exception")
    } catch (ok: AssertException) {}
}
