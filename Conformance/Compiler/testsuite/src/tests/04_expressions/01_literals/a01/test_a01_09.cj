
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_09

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks value and type of the floating-point literals. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var x1 = 2.0f16
    Assert.approxEquals(2.0, x1)
    Assert.isTrue(x1 is Float16)

    var x2 = 2.0f32
    Assert.approxEquals(2.0, x2)
    Assert.isTrue(x2 is Float32)

    var x3 = 2.0f64
    Assert.approxEquals(2.0, x3)
    Assert.isTrue(x3 is Float64)

    var x4 = 2.0
    Assert.approxEquals(2.0, x4)
    Assert.isTrue(x4 is Float64)

    var x5 = .0f16
    Assert.approxEquals(0.0,x5)
    Assert.isTrue(x5 is Float16)

    var x6 = .0f32
    Assert.approxEquals(0.0, x6)
    Assert.isTrue(x6 is Float32)

    var x7 = .0f64
    Assert.approxEquals(0.0, x7)
    Assert.isTrue(x7 is Float64)

    var x8 = .0
    Assert.approxEquals(0.0, x8)
    Assert.isTrue(x8 is Float64)

    var x9 = 2.002e4f16
    Assert.approxEquals(2.0016000000e4, x9)
    Assert.isTrue(x9 is Float16)

    var x10 = 2.002E4f32
    Assert.approxEquals(2.0020e4, x10)
    Assert.isTrue(x10 is Float32)

    var x11 = 2.002e4f64
    Assert.approxEquals(2.0020e4, x11)
    Assert.isTrue(x11 is Float64)

    var x12 = .002E4
    Assert.approxEquals(2.0e1, x12)
    Assert.isTrue(x12 is Float64)

    var x13 = 2.002e-4f16
    Assert.approxEquals(2.0020e4, x11)
    Assert.isTrue(x13 is Float16)

    var x14 = 2.002E-4f32
    Assert.approxEquals(2.0020e-4, x14)
    Assert.isTrue(x14 is Float32)

    var x15 = 2.002e-4f64
    Assert.approxEquals(2.0020e-4, x15)
    Assert.isTrue(x15 is Float64)

    var x16 = .002E-4
    Assert.approxEquals(0.0000002, x16)
    Assert.isTrue(x16 is Float64)
}
