
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_16_a02_0001

  @Level:         1

  @Assertion:   4.16(2) All relational operators are binary operators which requires two operands have the same type.
  @Description: Checks that using the following combinations of binary operators and operand types is permitted.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue(true == true)
    Assert.isFalse(true != true)
    Assert.isTrue((1, 1) == (1, 1))
    Assert.isFalse((1, 1) != (1, 1))
    Assert.isTrue(() == ())
    Assert.isFalse(() != ())
    Assert.isTrue([1] == [1])
    Assert.isFalse([1] != [1])
    Assert.isFalse(Int8(1) < Int8(1))
    Assert.isTrue(Int8(1) <= Int8(1))
    Assert.isTrue(Int8(1) >= Int8(1))
    Assert.isFalse(Int8(1) > Int8(1))
    Assert.isFalse(Int16(1) < Int16(1))
    Assert.isTrue(Int16(1) <= Int16(1))
    Assert.isTrue(Int16(1) >= Int16(1))
    Assert.isFalse(Int16(1) > Int16(1))
    Assert.isFalse(Int32(1) < Int32(1))
    Assert.isTrue(Int32(1) <= Int32(1))
    Assert.isTrue(Int32(1) >= Int32(1))
    Assert.isFalse(Int32(1) > Int32(1))
    Assert.isFalse(Int64(1) < Int64(1))
    Assert.isTrue(Int64(1) <= Int64(1))
    Assert.isTrue(Int64(1) >= Int64(1))
    Assert.isFalse(Int64(1) > Int64(1))
    Assert.isFalse(UInt8(1) < UInt8(1))
    Assert.isTrue(UInt8(1) <= UInt8(1))
    Assert.isTrue(UInt8(1) >= UInt8(1))
    Assert.isFalse(UInt8(1) > UInt8(1))
    Assert.isFalse(UInt16(1) < UInt16(1))
    Assert.isTrue(UInt16(1) <= UInt16(1))
    Assert.isTrue(UInt16(1) >= UInt16(1))
    Assert.isFalse(UInt16(1) > UInt16(1))
    Assert.isFalse(UInt32(1) < UInt32(1))
    Assert.isTrue(UInt32(1) <= UInt32(1))
    Assert.isTrue(UInt32(1) >= UInt32(1))
    Assert.isFalse(UInt32(1) > UInt32(1))
    Assert.isFalse(UInt64(1) < UInt64(1))
    Assert.isTrue(UInt64(1) <= UInt64(1))
    Assert.isTrue(UInt64(1) >= UInt64(1))
    Assert.isFalse(UInt64(1) > UInt64(1))
    Assert.isFalse(Float16(1.0) < Float16(1.0))
    Assert.isTrue(Float16(1.0) <= Float16(1.0))
    Assert.isTrue(Float16(1.0) >= Float16(1.0))
    Assert.isFalse(Float16(1.0) > Float16(1.0))
    Assert.isFalse(Float32(1.0) < Float32(1.0))
    Assert.isTrue(Float32(1.0) <= Float32(1.0))
    Assert.isTrue(Float32(1.0) >= Float32(1.0))
    Assert.isFalse(Float32(1.0) > Float32(1.0))
    Assert.isFalse(Float64(1.0) < Float64(1.0))
    Assert.isTrue(Float64(1.0) <= Float64(1.0))
    Assert.isTrue(Float64(1.0) >= Float64(1.0))
    Assert.isFalse(Float64(1.0) > Float64(1.0))
    Assert.isFalse("1" < "1")
    Assert.isTrue("1" <= "1")
    Assert.isTrue("1" >= "1")
    Assert.isFalse("1" > "1")
    Assert.isFalse('1' < '1')
    Assert.isTrue('1' <= '1')
    Assert.isTrue('1' >= '1')
    Assert.isFalse('1' > '1')

    0
}
