/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_09

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that numeric type conversion expression has type and value.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

main() {
    Assert.isTrue(Int8(1) is Int8)
    Assert.equals(1, Int8(1))

    Assert.isTrue(Int16(2) is Int16)
    Assert.equals(2, Int16(2))

    Assert.isTrue(Int32(3) is Int32)
    Assert.equals(3, Int32(3))

    Assert.isTrue(Int64(4) is Int64)
    Assert.equals(4, Int64(4))

    Assert.isTrue(UInt8(1) is UInt8)
    Assert.equals(1, UInt8(1))

    Assert.isTrue(UInt16(2) is UInt16)
    Assert.equals(2, UInt16(2))

    Assert.isTrue(UInt32(3) is UInt32)
    Assert.equals(3, UInt32(3))

    Assert.isTrue(UInt64(4) is UInt64)
    Assert.equals(4, UInt64(4))

    Assert.isTrue(Float16(5) is Float16)
    Assert.equals(5.0, Float16(5))

    Assert.isTrue(Float32(6) is Float32)
    Assert.equals(6.0, Float32(6))

    Assert.isTrue(Float64(7) is Float64)
    Assert.equals(7.0, Float64(7))
}
