/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a16_01

  @Level:         1

  @Assertion:    2.3.1(16) Bidirectional conversion between floating-point types: the round-to-nearest mode is applied 
                 for rounding. 

  @Description:  Check that the conversion between floating-point types is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main(): Unit {

    let a1 = Float16(2.12345678922)
    let a2 = Float16(3.1234567_f32)
    let a3 = Float16(4.1234_f16)

    Assert.isTrue(a1 is Float16)
    Assert.isTrue(a2 is Float16)
    Assert.isTrue(a3 is Float16)

    Assert.approxEquals(2.1234, a1)
    Assert.approxEquals(3.1234, a2)
    Assert.approxEquals(4.1234, a3)

    var a4 = Float32(5.12345678922)
    var a5 = Float32(6.1234567_f32)
    var a6 = Float32(7.1234_f16)

    Assert.isTrue(a4 is Float32)
    Assert.isTrue(a5 is Float32)
    Assert.isTrue(a6 is Float32)

    Assert.approxEquals(5.1234567, a4)
    Assert.approxEquals(6.1234567, a5)
    Assert.approxEquals(7.1234, a6)

    let a7 = Float64(8.12345678922)
    var a8 = Float64(9.1234567_f32)
    let a9 = Float64(10.000000001_f16)

    Assert.isTrue(a7 is Float64)
    Assert.isTrue(a8 is Float64)
    Assert.isTrue(a9 is Float64)

    Assert.approxEquals(8.12345678922, a7)
    Assert.approxEquals(9.1234567, a8)
    Assert.approxEquals(10.0, a9)
}
