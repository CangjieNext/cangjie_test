/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_03_a03_06

  @Level:         1
  @Assertion:       2.1.1.3(3) We remark the operations are defined for special floating-point values as follows: in a
                    relational expression, if the value of one operand is NaN, the result of the expression is false,
                    except that the result of NaN != x is true where x can be any floating-point number including NaN.

  @Description:     Check that relational expressions with operator != and the operands of type Float64/32/16, both of
                    which are NaN, evaluate to `true`.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006075

*/

import utils.assert.Assert

main(inp: Array<String>) {
    // NaN -- constant.
    Assert.isTrue(Float64.NaN != Float64.NaN)
    Assert.isTrue(Float32.NaN != Float32.NaN)
    Assert.isTrue(Float16.NaN != Float16.NaN)
    Assert.isTrue(-Float64.NaN != Float64.NaN)
    Assert.isTrue(-Float32.NaN != Float32.NaN)
    Assert.isTrue(-Float16.NaN != Float16.NaN)
    Assert.isTrue(Float64.NaN != -Float64.NaN)
    Assert.isTrue(Float32.NaN != -Float32.NaN)
    Assert.isTrue(Float16.NaN != -Float16.NaN)
    Assert.isTrue(-Float64.NaN != -Float64.NaN)
    Assert.isTrue(-Float32.NaN != -Float32.NaN)
    Assert.isTrue(-Float16.NaN != -Float16.NaN)

    // NaN -- temporary object.
    let getNaN64 = { => Float64(Assert.getRuntimeZero(inp)) / .0 }
    let getNaN32 = { => Float32(Assert.getRuntimeZero(inp)) / .0 }
    let getNaN16 = { => Float16(Assert.getRuntimeZero(inp)) / .0 }
    for (sign in [-1.0, 1.0]) {
        Assert.isTrue(sign * getNaN64() != getNaN64())
        Assert.isTrue(sign * getNaN64() != -getNaN64())
    }
    for (sign in [-1.0f32, 1.0f32]) {
        Assert.isTrue(sign * getNaN32() != getNaN32())
        Assert.isTrue(sign * getNaN32() != -getNaN32())
    }
    for (sign in [-1.0f16, 1.0f16]) {
        Assert.isTrue(sign * getNaN16() != getNaN16())
        Assert.isTrue(sign * getNaN16() != -getNaN16())
    }

    // NaN -- variable.
    var nan64: Float64
    var nan32: Float32
    var nan16: Float16
    var nanNeg64: Float64
    var nanNeg32: Float32
    var nanNeg16: Float16

    for (sign in [-1.0, 1.0]) {
        nan64 = getNaN64()
        nanNeg64 = -getNaN64()
        Assert.isTrue(nan64 != sign * nan64)
        Assert.isTrue(nanNeg64 != sign * nan64)
    }
    for (sign in [-1.0f32, 1.0f32]) {
        nan32 = getNaN32()
        nanNeg32 = -getNaN32()
        Assert.isTrue(nan32 != sign * nan32)
        Assert.isTrue(nanNeg32 != sign * nan32)
    }
    for (sign in [-1.0f16, 1.0f16]) {
        nan16 = getNaN16()
        nanNeg16 = -getNaN16()
        Assert.isTrue(nan16 != sign * nan16)
        Assert.isTrue(nanNeg16 != sign * nan16)
    }
}
