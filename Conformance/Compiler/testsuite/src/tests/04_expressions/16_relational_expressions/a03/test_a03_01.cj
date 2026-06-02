
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_16_a03_01

  @Level:         1

  @Assertion:   4.16(3) The value of a relational expression has a Bool type, i.e., it can either be true or false. See
                the last section for their precedence and associativity.
  @Description: Checks that various relational expressions have a Bool type.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue((true == true) is Bool)
    Assert.isTrue((true != true) is Bool)
    Assert.isTrue(((1, 1) == (1, 1)) is Bool)
    Assert.isTrue(((1, 1) != (1, 1)) is Bool)
    Assert.isTrue((() == ()) is Bool)
    Assert.isTrue((() != ()) is Bool)
    Assert.isTrue(([1] == [1]) is Bool)
    Assert.isTrue(([1] != [1]) is Bool)
    Assert.isTrue((Int8(1) < Int8(1)) is Bool)
    Assert.isTrue((Int16(1) < Int16(1)) is Bool)
    Assert.isTrue((Int32(1) < Int32(1)) is Bool)
    Assert.isTrue((Int64(1) < Int64(1)) is Bool)
    Assert.isTrue((UInt8(1) < UInt8(1)) is Bool)
    Assert.isTrue((UInt16(1) < UInt16(1)) is Bool)
    Assert.isTrue((UInt32(1) < UInt32(1)) is Bool)
    Assert.isTrue((UInt64(1) < UInt64(1)) is Bool)
    Assert.isTrue((Float16(1.0) < Float16(1.0)) is Bool)
    Assert.isTrue((Float32(1.0) < Float32(1.0)) is Bool)
    Assert.isTrue((Float64(1.0) < Float64(1.0)) is Bool)
    Assert.isTrue(('1' < '1') is Bool)
    Assert.isTrue(("1" < "1") is Bool)
    Assert.isTrue((Int8(1) <= Int8(1)) is Bool)
    Assert.isTrue((Int16(1) <= Int16(1)) is Bool)
    Assert.isTrue((Int32(1) <= Int32(1)) is Bool)
    Assert.isTrue((Int64(1) <= Int64(1)) is Bool)
    Assert.isTrue((UInt8(1) <= UInt8(1)) is Bool)
    Assert.isTrue((UInt16(1) <= UInt16(1)) is Bool)
    Assert.isTrue((UInt32(1) <= UInt32(1)) is Bool)
    Assert.isTrue((UInt64(1) <= UInt64(1)) is Bool)
    Assert.isTrue((Float16(1.0) <= Float16(1.0)) is Bool)
    Assert.isTrue((Float32(1.0) <= Float32(1.0)) is Bool)
    Assert.isTrue((Float64(1.0) <= Float64(1.0)) is Bool)
    Assert.isTrue(('1' <= '1') is Bool)
    Assert.isTrue(("1" <= "1") is Bool)
    Assert.isTrue((Int8(1) >= Int8(1)) is Bool)
    Assert.isTrue((Int16(1) >= Int16(1)) is Bool)
    Assert.isTrue((Int32(1) >= Int32(1)) is Bool)
    Assert.isTrue((Int64(1) >= Int64(1)) is Bool)
    Assert.isTrue((UInt8(1) >= UInt8(1)) is Bool)
    Assert.isTrue((UInt16(1) >= UInt16(1)) is Bool)
    Assert.isTrue((UInt32(1) >= UInt32(1)) is Bool)
    Assert.isTrue((UInt64(1) >= UInt64(1)) is Bool)
    Assert.isTrue((Float16(1.0) >= Float16(1.0)) is Bool)
    Assert.isTrue((Float32(1.0) >= Float32(1.0)) is Bool)
    Assert.isTrue((Float64(1.0) >= Float64(1.0)) is Bool)
    Assert.isTrue(('1' >= '1') is Bool)
    Assert.isTrue(("1" >= "1") is Bool)
    Assert.isTrue((Int8(1) > Int8(1)) is Bool)
    Assert.isTrue((Int16(1) > Int16(1)) is Bool)
    Assert.isTrue((Int32(1) > Int32(1)) is Bool)
    Assert.isTrue((Int64(1) > Int64(1)) is Bool)
    Assert.isTrue((UInt8(1) > UInt8(1)) is Bool)
    Assert.isTrue((UInt16(1) > UInt16(1)) is Bool)
    Assert.isTrue((UInt32(1) > UInt32(1)) is Bool)
    Assert.isTrue((UInt64(1) > UInt64(1)) is Bool)
    Assert.isTrue((Float16(1.0) > Float16(1.0)) is Bool)
    Assert.isTrue((Float32(1.0) > Float32(1.0)) is Bool)
    Assert.isTrue((Float64(1.0) > Float64(1.0)) is Bool)
    Assert.isTrue(('1' > '1') is Bool)
    Assert.isTrue(("1" > "1") is Bool)
    Assert.isTrue((Int8(1) == Int8(1)) is Bool)
    Assert.isTrue((Int16(1) == Int16(1)) is Bool)
    Assert.isTrue((Int32(1) == Int32(1)) is Bool)
    Assert.isTrue((Int64(1) == Int64(1)) is Bool)
    Assert.isTrue((UInt8(1) == UInt8(1)) is Bool)
    Assert.isTrue((UInt16(1) == UInt16(1)) is Bool)
    Assert.isTrue((UInt32(1) == UInt32(1)) is Bool)
    Assert.isTrue((UInt64(1) == UInt64(1)) is Bool)
    Assert.isTrue((Float16(1.0) == Float16(1.0)) is Bool)
    Assert.isTrue((Float32(1.0) == Float32(1.0)) is Bool)
    Assert.isTrue((Float64(1.0) == Float64(1.0)) is Bool)
    Assert.isTrue(('1' == '1') is Bool)
    Assert.isTrue(("1" == "1") is Bool)
    Assert.isTrue((Int8(1) != Int8(1)) is Bool)
    Assert.isTrue((Int16(1) != Int16(1)) is Bool)
    Assert.isTrue((Int32(1) != Int32(1)) is Bool)
    Assert.isTrue((Int64(1) != Int64(1)) is Bool)
    Assert.isTrue((UInt8(1) != UInt8(1)) is Bool)
    Assert.isTrue((UInt16(1) != UInt16(1)) is Bool)
    Assert.isTrue((UInt32(1) != UInt32(1)) is Bool)
    Assert.isTrue((UInt64(1) != UInt64(1)) is Bool)
    Assert.isTrue((Float16(1.0) != Float16(1.0)) is Bool)
    Assert.isTrue((Float32(1.0) != Float32(1.0)) is Bool)
    Assert.isTrue((Float64(1.0) != Float64(1.0)) is Bool)
    Assert.isTrue(('1' != '1') is Bool)
    Assert.isTrue(("1" != "1") is Bool)

    0
}
