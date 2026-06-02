/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a25_01

  @Level:         1

  @Assertion:    2.3.1(25) When there is precision loss, the round-to-nearest mode is applied for rounding. 

  @Description:  Check that if precision is lost, the round-to-nearest mode is applied for rounding.

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main(): Unit {
    Assert.equals(5.125000, Float16(5.123456789123))
    Assert.equals(6.125000, Float16(6.1234567_f32))
    Assert.equals(6.124000, Float16(6.1234444_f32))
    Assert.equals(7.123457, Float32(7.123456789123))
    Assert.equals(7.123456, Float32(7.123456123456))
}