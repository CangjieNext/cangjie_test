/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_03_a17_01

  @Level:         1
  @Assertion:       2.1.1.3(17) num / Inf  = sign(num)*sign(Inf)0.0 | num is a non-zero positive floating-point number.
                    Inf is POSITIVE_INFINITY or NEGATIVE_INFINITY. The sign of result is determined by the signs of num
                    (i.e., sign(num)) and Inf (i.e., sign(NEGATIVE_INFINITY) = ‘-’)

  @Description:     Check that a non-zero positive number divided by +inf gives +0, and divided by -inf gives -0 for
                    Float64/32/16.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006075,0006320,0006385
*/

import utils.assert.Assert

main(inp: Array<String>) {
    Assert.isTrue(Float64.MinDenormal / Float64.Inf == .0)
    Assert.isTrue(Float32.MinDenormal / Float32.Inf == .0)
    Assert.isTrue(Float16.MinDenormal / Float16.Inf == .0)
    Assert.isTrue(Float64.MinNormal / Float64.Inf == .0)
    Assert.isTrue(Float32.MinNormal / Float32.Inf == .0)
    Assert.isTrue(Float16.MinNormal / Float16.Inf == .0)
    Assert.isTrue(Float64.Max / Float64.Inf == .0)
    Assert.isTrue(Float32.Max / Float32.Inf == .0)
    Assert.isTrue(Float16.Max / Float16.Inf == .0)

    Assert.isTrue(Float64.MinDenormal / -Float64.Inf == -0.0)
    Assert.isTrue(Float32.MinDenormal / -Float32.Inf == -0.0)
    Assert.isTrue(Float16.MinDenormal / -Float16.Inf == -0.0)
    Assert.isTrue(Float64.MinNormal / -Float64.Inf == -0.0)
    Assert.isTrue(Float32.MinNormal / -Float32.Inf == -0.0)
    Assert.isTrue(Float16.MinNormal / -Float16.Inf == -0.0)
    Assert.isTrue(Float64.Max / -Float64.Inf == -0.0)
    Assert.isTrue(Float32.Max / -Float32.Inf == -0.0)
    Assert.isTrue(Float16.Max / -Float16.Inf == -0.0)

    // Returns some number.
    let getN64 = { => Float64(Assert.getRuntimeZero(inp)) + 0.9 }
    let getN32 = { => Float32(Assert.getRuntimeZero(inp)) + 56.9 }
    let getN16 = { => Float16(Assert.getRuntimeZero(inp)) + 13.33 }
    Assert.isTrue(getN64() / Float64.Inf == .0)
    Assert.isTrue(getN32() / Float32.Inf == .0)
    Assert.isTrue(getN16() / Float16.Inf == .0)

    Assert.isTrue(getN64() / -Float64.Inf == -0.0)
    Assert.isTrue(getN32() / -Float32.Inf == -0.0)
    Assert.isTrue(getN16() / -Float16.Inf == -0.0)
}
