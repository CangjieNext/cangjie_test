
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_10

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks that float literal type is determined by the program
                context. Checks Float16.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: yes

*/

import utils.assert.Assert

let f16: Float16 = Float16(Assert.getRuntimeZero() + 1)

main() {  
    // Literal type is the same as variable type
    var x1: Float16 = 3.145628
    var x2: Float16 = .145628
    var x3: Float16 = 3e4
    var x4: Float16 = 345e-4

    // Literal type is the same as the type of the second literal:

    var x5 = 10.3f16 + 3.145628
    Assert.isTrue(x5 is Float16)

    var x6 = 3.145628 - 10.3f16
    Assert.isTrue(x6 is Float16)

    var x7 = 10.3f16 * 3.145628
    Assert.isTrue(x7 is Float16)

    var x8 = 3.145628 / 10.3f16
    Assert.isTrue(x8 is Float16)

    var x9 = 10.3f16 + .14
    Assert.isTrue(x9 is Float16)

    var x10 = .14 - 10.3f16
    Assert.isTrue(x10 is Float16)

    var x11 = 10.3f16 * .14
    Assert.isTrue(x11 is Float16)

    var x12 = .14 / 10.3f16
    Assert.isTrue(x12 is Float16)

    var x13 = 10.3f16 + 12345e3
    Assert.isTrue(x13 is Float16)

    var x14 = 12345e3 - 10.3f16
    Assert.isTrue(x14 is Float16)

    var x15 = 10.3f16 * 12345e3
    Assert.isTrue(x15 is Float16)

    var x16 = 12345e3 / 10.3f16
    Assert.isTrue(x16 is Float16)

    var x17 = 10.3f16 + 12345e-3
    Assert.isTrue(x17 is Float16)

    var x18 = 12345e-3 - 10.3f16
    Assert.isTrue(x18 is Float16)

    var x19 = 10.3f16 * 12345e-3
    Assert.isTrue(x19 is Float16)

    var x20 = 12345e-3 / 10.3f16
    Assert.isTrue(x20 is Float16)

    // Literal type is the same as the type of the variable type:

    var x21 = f16 + 3.145628
    Assert.isTrue(x21 is Float16)

    var x22 = 3.145628 - f16
    Assert.isTrue(x22 is Float16)

    var x23 = f16 * 3.145628
    Assert.isTrue(x23 is Float16)

    var x24 = 3.145628 / f16
    Assert.isTrue(x24 is Float16)

    var x25 = f16 + .14
    Assert.isTrue(x25 is Float16)

    var x26 = .14 - f16
    Assert.isTrue(x26 is Float16)

    var x27 = f16 * .14
    Assert.isTrue(x27 is Float16)

    var x28 = .14 / f16
    Assert.isTrue(x28 is Float16)

    var x29 = f16 + 12345e3
    Assert.isTrue(x29 is Float16)

    var x30 = 12345e3 - f16
    Assert.isTrue(x30 is Float16)

    var x31 = f16 * 12345e3
    Assert.isTrue(x31 is Float16)

    var x32 = 12345e3 / f16
    Assert.isTrue(x32 is Float16)

    var x33 = f16 + 12345e-3
    Assert.isTrue(x33 is Float16)

    var x34 = 12345e-3 - f16
    Assert.isTrue(x34 is Float16)

    var x35 = f16 * 12345e-3
    Assert.isTrue(x35 is Float16)

    var x36 = 12345e-3 / f16
    Assert.isTrue(x36 is Float16)
}
