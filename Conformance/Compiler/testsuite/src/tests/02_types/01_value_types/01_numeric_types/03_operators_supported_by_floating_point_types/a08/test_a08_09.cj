/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_03_a08_09

  @Level:         1
  @Assertion:       2.1.1.3(8) NaN op num = NaN | op is any arithmetic operator, and num can be any floating point
                    number (including NaN, 0, POSITIVE_INFINITY and NEGATIVE_INFINITY)

  @Description:     Check that (NEGATIVE_INFINITY op NaN = NaN) where op is one of the {+, -, *, /, **} operations and
                    NaN is Float64/32/16.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006075,0006385
*/

import utils.assert.Assert

main() {
    Assert.isTrue((-Float64.Inf + Float64.NaN).isNaN())
    Assert.isTrue((-Float32.Inf + Float32.NaN).isNaN())
    Assert.isTrue((-Float16.Inf + Float16.NaN).isNaN())

    Assert.isTrue((-Float64.Inf - Float64.NaN).isNaN())
    Assert.isTrue((-Float32.Inf - Float32.NaN).isNaN())
    Assert.isTrue((-Float16.Inf - Float16.NaN).isNaN())

    Assert.isTrue((-Float64.Inf * Float64.NaN).isNaN())
    Assert.isTrue((-Float32.Inf * Float32.NaN).isNaN())
    Assert.isTrue((-Float16.Inf * Float16.NaN).isNaN())

    Assert.isTrue((-Float64.Inf / Float64.NaN).isNaN())
    Assert.isTrue((-Float32.Inf / Float32.NaN).isNaN())
    Assert.isTrue((-Float16.Inf / Float16.NaN).isNaN())

    Assert.isTrue((-Float64.Inf ** Float64.NaN).isNaN())
}
