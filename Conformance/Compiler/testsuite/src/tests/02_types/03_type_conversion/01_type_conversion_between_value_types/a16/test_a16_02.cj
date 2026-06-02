/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a16_02

  @Level:         1

  @Assertion:    2.3.1(16) Bidirectional conversion between floating-point types: the round-to-nearest mode is applied 
                 for rounding. 

  @Description:  Check that the round-to-nearest mode is applied for rounding

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main(): Unit {
    let a1 = Float16(2.12345678922)
    let a2 = Float32(3.12345678922)

    Assert.approxEquals(2.1234000, a1)
    Assert.approxEquals(3.123467000, a2)

    let a3 = Float32(5.1234_f16)
    let a4 = Float64(6.1234567_f32)

    Assert.approxEquals(5.1234000, a3)
    Assert.approxEquals(6.1234567000, a4)
}
