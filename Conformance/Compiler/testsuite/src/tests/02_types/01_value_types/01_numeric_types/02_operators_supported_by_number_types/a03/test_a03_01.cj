/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a03_01

  @Level:         1
  @Assertion:       2.1.1.2(3) All but bitwise operators are defined for floating-point types.

  @Description:     Check +, -, *, /, **, <, <=, ==, >, >=, !=, unary -, +=, -=, *=, /=, **= for Float64/32/16.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Comment:         %, ++ and -- not tested according to 6166.
  @Issue:           0006166
*/

import utils.assert.Assert

main() {
    var f64_1: Float64 = 44.18
    var f64_2: Float64 = 94.42
    Assert.approxEquals(138.6, f64_1 + f64_2)
    Assert.approxEquals(-50.24, f64_1 - f64_2)
    Assert.approxEquals(4171.4756, f64_1 * f64_2)
    Assert.approxEquals(0.4679093412412624, f64_1 / f64_2)
    Assert.approxEquals(2.1989314115157901139919121817807e155, f64_1 ** f64_2)
    Assert.isTrue(f64_1 < f64_2)
    Assert.isTrue(f64_1 <= f64_2)
    Assert.isTrue(f64_1 == f64_1)
    Assert.isTrue(f64_2 > f64_1)
    Assert.isTrue(f64_2 >= f64_1)
    Assert.isTrue(f64_1 != f64_2)
    Assert.approxEquals(-44.18, -f64_1)
    f64_1 += f64_2
    Assert.approxEquals(138.6, f64_1)
    f64_1 -= f64_2
    Assert.approxEquals(44.18, f64_1)
    f64_1 *= f64_2
    Assert.approxEquals(4171.4756, f64_1)
    f64_1 /= f64_2
    Assert.approxEquals(44.18, f64_1)
    f64_1 **= f64_2
    Assert.approxEquals(2.1989314115157901139919121817807e155, f64_1)

    var f32_1: Float32 = 86.85
    var f32_2: Float32 = 50.49
    Assert.approxEquals(137.34, f32_1 + f32_2)
    Assert.approxEquals(36.36, f32_1 - f32_2)
    Assert.approxEquals(4385.0565, f32_1 * f32_2)
    Assert.approxEquals(1.720142602495544, f32_1 / f32_2)
    Assert.isTrue(f32_2 < f32_1)
    Assert.isTrue(f32_2 <= f32_1)
    Assert.isTrue(f32_1 == f32_1)
    Assert.isTrue(f32_1 > f32_2)
    Assert.isTrue(f32_1 >= f32_2)
    Assert.isTrue(f32_1 != f32_2)
    Assert.approxEquals(-86.85, -f32_1)
    f32_1 += f32_2
    Assert.approxEquals(137.34, f32_1)
    f32_1 -= f32_2
    Assert.approxEquals(86.85, f32_1)
    f32_1 *= f32_2
    Assert.approxEquals(4385.0565, f32_1)
    f32_1 /= f32_2
    Assert.approxEquals(86.85, f32_1)

    var f16_1: Float16 = 83.0
    var f16_2: Float16 = 51.0
    Assert.approxEquals(134.0, f16_1 + f16_2)
    Assert.approxEquals(32.0, f16_1 - f16_2)
    Assert.approxEquals(4233.0, f16_1 * f16_2)
    Assert.approxEquals(1.627450980392157, f16_1 / f16_2)
    Assert.isTrue(f16_2 < f16_1)
    Assert.isTrue(f16_2 <= f16_1)
    Assert.isTrue(f16_1 == f16_1)
    Assert.isTrue(f16_1 > f16_2)
    Assert.isTrue(f16_1 >= f16_2)
    Assert.isTrue(f16_1 != f16_2)
    Assert.approxEquals(-83.0, -f16_1)
    f16_1 += f16_2
    Assert.approxEquals(134.0, f16_1)
    f16_1 -= f16_2
    Assert.approxEquals(83.0, f16_1)
    f16_1 *= f16_2
    Assert.approxEquals(4233.0, f16_1)
    f16_1 /= f16_2
    Assert.approxEquals(83.0, f16_1)
}
