
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_18_a08_01

  @Level:         1

  @Assertion:   4.18(8) Note that the type of two operands may be different.
  @Description: Checks that using the following combinations of << and >> with operand types, which are not the same,
                is permitted.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    Assert.equals(2, Int8(1) << Int16(1))
    Assert.equals(2, Int8(1) << Int32(1))
    Assert.equals(2, Int8(1) << Int64(1))
    Assert.equals(2, Int8(1) << UInt8(1))
    Assert.equals(2, Int8(1) << UInt16(1))
    Assert.equals(2, Int8(1) << UInt32(1))
    Assert.equals(2, Int8(1) << UInt64(1))
    Assert.equals(2, Int16(1) << Int8(1))
    Assert.equals(2, Int16(1) << Int32(1))
    Assert.equals(2, Int16(1) << Int64(1))
    Assert.equals(2, Int16(1) << UInt8(1))
    Assert.equals(2, Int16(1) << UInt16(1))
    Assert.equals(2, Int16(1) << UInt32(1))
    Assert.equals(2, Int16(1) << UInt64(1))
    Assert.equals(2, Int32(1) << Int8(1))
    Assert.equals(2, Int32(1) << Int16(1))
    Assert.equals(2, Int32(1) << Int64(1))
    Assert.equals(2, Int32(1) << UInt8(1))
    Assert.equals(2, Int32(1) << UInt16(1))
    Assert.equals(2, Int32(1) << UInt32(1))
    Assert.equals(2, Int32(1) << UInt64(1))
    Assert.equals(2, Int64(1) << Int8(1))
    Assert.equals(2, Int64(1) << Int16(1))
    Assert.equals(2, Int64(1) << Int32(1))
    Assert.equals(2, Int64(1) << UInt8(1))
    Assert.equals(2, Int64(1) << UInt16(1))
    Assert.equals(2, Int64(1) << UInt32(1))
    Assert.equals(2, Int64(1) << UInt64(1))
    Assert.equals(2, UInt8(1) << Int8(1))
    Assert.equals(2, UInt8(1) << Int16(1))
    Assert.equals(2, UInt8(1) << Int32(1))
    Assert.equals(2, UInt8(1) << Int64(1))
    Assert.equals(2, UInt8(1) << UInt16(1))
    Assert.equals(2, UInt8(1) << UInt32(1))
    Assert.equals(2, UInt8(1) << UInt64(1))
    Assert.equals(2, UInt16(1) << Int8(1))
    Assert.equals(2, UInt16(1) << Int16(1))
    Assert.equals(2, UInt16(1) << Int32(1))
    Assert.equals(2, UInt16(1) << Int64(1))
    Assert.equals(2, UInt16(1) << UInt8(1))
    Assert.equals(2, UInt16(1) << UInt32(1))
    Assert.equals(2, UInt16(1) << UInt64(1))
    Assert.equals(2, UInt32(1) << Int8(1))
    Assert.equals(2, UInt32(1) << Int16(1))
    Assert.equals(2, UInt32(1) << Int32(1))
    Assert.equals(2, UInt32(1) << Int64(1))
    Assert.equals(2, UInt32(1) << UInt8(1))
    Assert.equals(2, UInt32(1) << UInt16(1))
    Assert.equals(2, UInt32(1) << UInt64(1))
    Assert.equals(2, UInt64(1) << Int8(1))
    Assert.equals(2, UInt64(1) << Int16(1))
    Assert.equals(2, UInt64(1) << Int32(1))
    Assert.equals(2, UInt64(1) << Int64(1))
    Assert.equals(2, UInt64(1) << UInt8(1))
    Assert.equals(2, UInt64(1) << UInt16(1))
    Assert.equals(2, UInt64(1) << UInt32(1))
    Assert.equals(0, Int8(1) >> Int16(1))
    Assert.equals(0, Int8(1) >> Int32(1))
    Assert.equals(0, Int8(1) >> Int64(1))
    Assert.equals(0, Int8(1) >> UInt8(1))
    Assert.equals(0, Int8(1) >> UInt16(1))
    Assert.equals(0, Int8(1) >> UInt32(1))
    Assert.equals(0, Int8(1) >> UInt64(1))
    Assert.equals(0, Int16(1) >> Int8(1))
    Assert.equals(0, Int16(1) >> Int32(1))
    Assert.equals(0, Int16(1) >> Int64(1))
    Assert.equals(0, Int16(1) >> UInt8(1))
    Assert.equals(0, Int16(1) >> UInt16(1))
    Assert.equals(0, Int16(1) >> UInt32(1))
    Assert.equals(0, Int16(1) >> UInt64(1))
    Assert.equals(0, Int32(1) >> Int8(1))
    Assert.equals(0, Int32(1) >> Int16(1))
    Assert.equals(0, Int32(1) >> Int64(1))
    Assert.equals(0, Int32(1) >> UInt8(1))
    Assert.equals(0, Int32(1) >> UInt16(1))
    Assert.equals(0, Int32(1) >> UInt32(1))
    Assert.equals(0, Int32(1) >> UInt64(1))
    Assert.equals(0, Int64(1) >> Int8(1))
    Assert.equals(0, Int64(1) >> Int16(1))
    Assert.equals(0, Int64(1) >> Int32(1))
    Assert.equals(0, Int64(1) >> UInt8(1))
    Assert.equals(0, Int64(1) >> UInt16(1))
    Assert.equals(0, Int64(1) >> UInt32(1))
    Assert.equals(0, Int64(1) >> UInt64(1))
    Assert.equals(0, UInt8(1) >> Int8(1))
    Assert.equals(0, UInt8(1) >> Int16(1))
    Assert.equals(0, UInt8(1) >> Int32(1))
    Assert.equals(0, UInt8(1) >> Int64(1))
    Assert.equals(0, UInt8(1) >> UInt16(1))
    Assert.equals(0, UInt8(1) >> UInt32(1))
    Assert.equals(0, UInt8(1) >> UInt64(1))
    Assert.equals(0, UInt16(1) >> Int8(1))
    Assert.equals(0, UInt16(1) >> Int16(1))
    Assert.equals(0, UInt16(1) >> Int32(1))
    Assert.equals(0, UInt16(1) >> Int64(1))
    Assert.equals(0, UInt16(1) >> UInt8(1))
    Assert.equals(0, UInt16(1) >> UInt32(1))
    Assert.equals(0, UInt16(1) >> UInt64(1))
    Assert.equals(0, UInt32(1) >> Int8(1))
    Assert.equals(0, UInt32(1) >> Int16(1))
    Assert.equals(0, UInt32(1) >> Int32(1))
    Assert.equals(0, UInt32(1) >> Int64(1))
    Assert.equals(0, UInt32(1) >> UInt8(1))
    Assert.equals(0, UInt32(1) >> UInt16(1))
    Assert.equals(0, UInt32(1) >> UInt64(1))
    Assert.equals(0, UInt64(1) >> Int8(1))
    Assert.equals(0, UInt64(1) >> Int16(1))
    Assert.equals(0, UInt64(1) >> Int32(1))
    Assert.equals(0, UInt64(1) >> Int64(1))
    Assert.equals(0, UInt64(1) >> UInt8(1))
    Assert.equals(0, UInt64(1) >> UInt16(1))
    Assert.equals(0, UInt64(1) >> UInt32(1))
}
