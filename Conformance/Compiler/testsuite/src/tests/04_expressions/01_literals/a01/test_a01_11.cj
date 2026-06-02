
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_11

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks that float literal type is determined by the program
                context. Checks Float32.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

let f32: Float32 = Float32(Assert.getRuntimeZero() + 1)

main() {  
    // Literal type is the same as variable type
    var x1: Float32 = 3.145628
    var x2: Float32 = .145628
    var x3: Float32 = 3e4
    var x4: Float32 = 345e-4

    // Literal type is the same as the type of the second literal:

    var x5 = 10.3f32 + 3.145628
    Assert.isTrue(x5 is Float32)

    var x6 = 3.145628 - 10.3f32
    Assert.isTrue(x6 is Float32)

    var x7 = 10.3f32 * 3.145628
    Assert.isTrue(x7 is Float32)

    var x8 = 3.145628 / 10.3f32
    Assert.isTrue(x8 is Float32)

    var x9 = 10.3f32 + .14
    Assert.isTrue(x9 is Float32)

    var x10 = .14 - 10.3f32
    Assert.isTrue(x10 is Float32)

    var x11 = 10.3f32 * .14
    Assert.isTrue(x11 is Float32)

    var x12 = .14 / 10.3f32
    Assert.isTrue(x12 is Float32)

    var x13 = 10.3f32 + 12345e3
    Assert.isTrue(x13 is Float32)

    var x14 = 12345e3 - 10.3f32
    Assert.isTrue(x14 is Float32)

    var x15 = 10.3f32 * 12345e3
    Assert.isTrue(x15 is Float32)

    var x16 = 12345e3 / 10.3f32
    Assert.isTrue(x16 is Float32)

    var x17 = 10.3f32 + 12345e-3
    Assert.isTrue(x17 is Float32)

    var x18 = 12345e-3 - 10.3f32
    Assert.isTrue(x18 is Float32)

    var x19 = 10.3f32 * 12345e-3
    Assert.isTrue(x19 is Float32)

    var x20 = 12345e-3 / 10.3f32
    Assert.isTrue(x20 is Float32)

    // Literal type is the same as the type of the variable type:

    var x21 = f32 + 3.145628
    Assert.isTrue(x21 is Float32)

    var x22 = 3.145628 - f32
    Assert.isTrue(x22 is Float32)

    var x23 = f32 * 3.145628
    Assert.isTrue(x23 is Float32)

    var x24 = 3.145628 / f32
    Assert.isTrue(x24 is Float32)

    var x25 = f32 + .14
    Assert.isTrue(x25 is Float32)

    var x26 = .14 - f32
    Assert.isTrue(x26 is Float32)

    var x27 = f32 * .14
    Assert.isTrue(x27 is Float32)

    var x28 = .14 / f32
    Assert.isTrue(x28 is Float32)

    var x29 = f32 + 12345e3
    Assert.isTrue(x29 is Float32)

    var x30 = 12345e3 - f32
    Assert.isTrue(x30 is Float32)

    var x31 = f32 * 12345e3
    Assert.isTrue(x31 is Float32)

    var x32 = 12345e3 / f32
    Assert.isTrue(x32 is Float32)

    var x33 = f32 + 12345e-3
    Assert.isTrue(x33 is Float32)

    var x34 = 12345e-3 - f32
    Assert.isTrue(x34 is Float32)

    var x35 = f32 * 12345e-3
    Assert.isTrue(x35 is Float32)

    var x36 = 12345e-3 / f32
    Assert.isTrue(x36 is Float32)
}
