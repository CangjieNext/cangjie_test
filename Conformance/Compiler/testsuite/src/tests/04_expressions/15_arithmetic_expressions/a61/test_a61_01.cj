
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a61_01

  @Level:         1

  @Assertion:   4.15(61) Note: the result of the power expression is NaN if there is a NaN among the operands of **,
                except in the cases listed above.
  @Description: Checks that NaN among the operands of ** results in NaN and exceptions to this rule.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 0006075
*/

import utils.assert.Assert
import std.random.Random

main() {
    let rnd = Random(123)

    Assert.equals(Float64.NaN, Float64.NaN ** Float64.NaN)

    Assert.equals(Float64.NaN, 0.0 ** Float64.NaN)
    Assert.equals(Float64.NaN, -0.0 ** Float64.NaN)
    Assert.notEquals(Float64.NaN, 1.0 ** Float64.NaN)
    Assert.equals(Float64.NaN, -1.0 ** Float64.NaN)
    Assert.equals(Float64.NaN, Float64.Inf ** Float64.NaN)
    Assert.equals(Float64.NaN, -Float64.Inf ** Float64.NaN)

    Assert.notEquals(Float64.NaN, Float64.NaN ** 0.0)
    Assert.notEquals(Float64.NaN, Float64.NaN ** -0.0)
    Assert.notEquals(Float64.NaN, Float64.NaN ** 0)
    Assert.equals(Float64.NaN, Float64.NaN ** 1.0)
    Assert.equals(Float64.NaN, Float64.NaN ** 1)
    Assert.equals(Float64.NaN, Float64.NaN ** -1.0)
    Assert.equals(Float64.NaN, Float64.NaN ** -1)
    Assert.equals(Float64.NaN, Float64.NaN ** Float64.Inf)
    Assert.equals(Float64.NaN, Float64.NaN ** -Float64.Inf)

    for (_ in 0..2**10) {
        let f = Float64(rnd.nextInt64()) + rnd.nextFloat64()
        let i = rnd.nextInt64()
        Assert.equals(Float64.NaN, Float64.NaN ** f)
        Assert.equals(Float64.NaN, Float64.NaN ** i)
        Assert.equals(Float64.NaN, f ** Float64.NaN)
    }
}