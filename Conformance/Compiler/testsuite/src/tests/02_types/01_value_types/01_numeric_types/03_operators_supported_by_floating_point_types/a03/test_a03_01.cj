/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_03_a03_01

  @Level:         1
  @Assertion:       2.1.1.3(3) We remark the operations are defined for special floating-point values as follows: in a
                    relational expression, if the value of one operand is NaN, the result of the expression is false,
                    except that the result of NaN != x is true where x can be any floating-point number including NaN.

  @Description:     Check that relational expressions with operators <, >, <=, >=, == and the operands of type
                    Float64/32/16, the first of which is NaN, evaluate to `false`.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Comment:         Since Spec uses the term "the value of operand", these tests test 3 operand types: a type constant,
                    a temporary object (operand=some other expression to be evaluated), and a variable.
  @Issue:           0006075

*/

import utils.assert.Assert

import std.math.*
import std.random.Random

main(inp: Array<String>) {
    let getNaN64 = { => Float64(Assert.getRuntimeZero(inp)) / .0 }
    let getNaN32 = { => Float32(Assert.getRuntimeZero(inp)) / .0 }
    let getNaN16 = { => Float16(Assert.getRuntimeZero(inp)) / .0 }
    let consts64 = [0.0, -0.0, 1.0, -1.0, Float64.Inf, -Float64.Inf, Float64.getPI(),
        -Float64.getPI(), Float64.getE(), -Float64.getE(), Float64.Max, -Float64.Max, Float64.Min, -Float64.Min, Float64.MinDenormal,
        -Float64.MinDenormal, Float64.MinNormal, -Float64.MinNormal, Random().nextFloat64() + 1.0]
    let consts32 = [0.0f32, -0.0f32, 1.0f32, -1.0f32, Float32.Inf, -Float32.Inf,
        Float32.getPI(), -Float32.getPI(), Float32.getE(), -Float32.getE(), Float32.Max, -Float32.Max, Float32.Min, -Float32.Min,
        Float32.MinDenormal, -Float32.MinDenormal, Float32.MinNormal, -Float32.MinNormal, Random().nextFloat32() + 1.0]
    let consts16 = [0.0f16, -0.0f16, 1.0f16, -1.0f16, Float16.Inf, -Float16.Inf,
        Float16.getPI(), -Float16.getPI(), Float16.getE(), -Float16.getE(), Float16.Max, -Float16.Max, Float16.Min, -Float16.Min,
        Float16.MinDenormal, -Float16.MinDenormal, Float16.MinNormal, -Float16.MinNormal, Random().nextFloat16() + 1.0]

    // NaN -- constant.
    for (x in consts64) {
        Assert.isFalse(Float64.NaN < x)
        Assert.isFalse(Float64.NaN > x)
        Assert.isFalse(Float64.NaN <= x)
        Assert.isFalse(Float64.NaN >= x)
        Assert.isFalse(Float64.NaN == x)

        Assert.isFalse(-Float64.NaN < x)
        Assert.isFalse(-Float64.NaN > x)
        Assert.isFalse(-Float64.NaN <= x)
        Assert.isFalse(-Float64.NaN >= x)
        Assert.isFalse(-Float64.NaN == x)
    }

    for (x in consts32) {
        Assert.isFalse(Float32.NaN < x)
        Assert.isFalse(Float32.NaN > x)
        Assert.isFalse(Float32.NaN <= x)
        Assert.isFalse(Float32.NaN >= x)
        Assert.isFalse(Float32.NaN == x)

        Assert.isFalse(-Float32.NaN < x)
        Assert.isFalse(-Float32.NaN > x)
        Assert.isFalse(-Float32.NaN <= x)
        Assert.isFalse(-Float32.NaN >= x)
        Assert.isFalse(-Float32.NaN == x)
    }

    for (x in consts16) {
        Assert.isFalse(Float16.NaN < x)
        Assert.isFalse(Float16.NaN > x)
        Assert.isFalse(Float16.NaN <= x)
        Assert.isFalse(Float16.NaN >= x)
        Assert.isFalse(Float16.NaN == x)

        Assert.isFalse(-Float16.NaN < x)
        Assert.isFalse(-Float16.NaN > x)
        Assert.isFalse(-Float16.NaN <= x)
        Assert.isFalse(-Float16.NaN >= x)
        Assert.isFalse(-Float16.NaN == x)
    }

    // NaN -- temporary object.
    for (sign in [-1.0, 1.0]) {
        for (x in consts64) {
            Assert.isFalse(sign * getNaN64() < x)
            Assert.isFalse(sign * getNaN64() > x)
            Assert.isFalse(sign * getNaN64() <= x)
            Assert.isFalse(sign * getNaN64() >= x)
            Assert.isFalse(sign * getNaN64() == x)
        }
    }
    for (sign in [-1.0f32, 1.0f32]) {
        for (x in consts32) {
            Assert.isFalse(sign * getNaN32() < x)
            Assert.isFalse(sign * getNaN32() > x)
            Assert.isFalse(sign * getNaN32() <= x)
            Assert.isFalse(sign * getNaN32() >= x)
            Assert.isFalse(sign * getNaN32() == x)
        }
    }
    for (sign in [-1.0f16, 1.0f16]) {
        for (x in consts16) {
            Assert.isFalse(sign * getNaN16() < x)
            Assert.isFalse(sign * getNaN16() > x)
            Assert.isFalse(sign * getNaN16() <= x)
            Assert.isFalse(sign * getNaN16() >= x)
            Assert.isFalse(sign * getNaN16() == x)
        }
    }

    // NaN -- variable.
    var nan64: Float64
    for (sign in [-1.0, 1.0]) {
        nan64 = sign * getNaN64()
        for (x in consts64) {
            Assert.isFalse(nan64 < x)
            Assert.isFalse(nan64 > x)
            Assert.isFalse(nan64 <= x)
            Assert.isFalse(nan64 >= x)
            Assert.isFalse(nan64 == x)
        }
    }
    var nan32: Float32
    for (sign in [-1.0f32, 1.0f32]) {
        nan32 = sign * getNaN32()
        for (x in consts32) {
            Assert.isFalse(nan32 < x)
            Assert.isFalse(nan32 > x)
            Assert.isFalse(nan32 <= x)
            Assert.isFalse(nan32 >= x)
            Assert.isFalse(nan32 == x)
        }
    }
    var nan16: Float16
    for (sign in [-1.0f16, 1.0f16]) {
        nan16 = sign * getNaN16()
        for (x in consts16) {
            Assert.isFalse(nan16 < x)
            Assert.isFalse(nan16 > x)
            Assert.isFalse(nan16 <= x)
            Assert.isFalse(nan16 >= x)
            Assert.isFalse(nan16 == x)
        }
    }
}
