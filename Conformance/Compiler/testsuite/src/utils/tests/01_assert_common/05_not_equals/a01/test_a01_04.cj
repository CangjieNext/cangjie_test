/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_05_a01_04
  @Assertion:       func notEquals<T>(unexpected: T, actual: T, reason!: String = "")

  @Description:     NaN test cases.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.notEquals(Float64.NaN, .0)
    Assert.notEquals(Float32.NaN, .0)
    Assert.notEquals(Float16.NaN, .0)

    Assert.notEquals(Float64.NaN, Float64.Inf)
    Assert.notEquals(Float32.NaN, Float32.Inf)
    Assert.notEquals(Float16.NaN, Float16.Inf)

    Assert.notEquals(Float64.NaN, Float64.NaN)
    Assert.notEquals(Float32.NaN, Float32.NaN)
    Assert.notEquals(Float16.NaN, Float16.NaN)

    Assert.notEquals(.0/.0, .0/.0)
    Assert.notEquals(.0f32/.0, .0f32/.0)
    Assert.notEquals(.0f16/.0, .0f16/.0)

    Assert.notEquals(Float64.NaN, .0/.0)
    Assert.notEquals(Float32.NaN, .0f32/.0)
    Assert.notEquals(Float16.NaN, .0f16/.0)
}
