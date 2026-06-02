/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a01_01

  @Level:         1

  @Assertion: 4.14(1) Increment and decrement expressions are expressions that contain the postfix increment
              operator (++) or postfix decrement operator (--).

  @Description: Check increment and decrement expressions usage.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    // Int64
    var counterI64: Int64 = 0
    counterI64++
    Assert.equals(1, counterI64)
    counterI64++
    Assert.equals(2, counterI64)
    counterI64--
    Assert.equals(1, counterI64)

    // Int32
    var counterI32: Int32 = 0
    counterI32++
    Assert.equals(1, counterI32)
    counterI32++
    Assert.equals(2, counterI32)
    counterI32--
    Assert.equals(1, counterI32)

    // Int16
    var counterI16: Int16 = 0
    counterI16++
    Assert.equals(1, counterI16)
    counterI16++
    Assert.equals(2, counterI16)
    counterI16--
    Assert.equals(1, counterI16)

    // Int8
    var counterI8: Int8 = 0
    counterI8++
    Assert.equals(1, counterI8)
    counterI8++
    Assert.equals(2, counterI8)
    counterI8--
    Assert.equals(1, counterI8)

    // UInt64
    var counterU64: UInt64 = 0
    counterU64++
    Assert.equals(1, counterU64)
    counterU64++
    Assert.equals(2, counterU64)
    counterU64--
    Assert.equals(1, counterU64)

    // UInt32
    var counterU32: UInt32 = 0
    counterU32++
    Assert.equals(1, counterU32)
    counterU32++
    Assert.equals(2, counterU32)
    counterU32--
    Assert.equals(1, counterU32)

    // UInt16
    var counterU16: UInt16 = 0
    counterU16++
    Assert.equals(1, counterU16)
    counterU16++
    Assert.equals(2, counterU16)
    counterU16--
    Assert.equals(1, counterU16)

    // UInt8
    var counterU8: UInt8 = 0
    counterU8++
    Assert.equals(1, counterU8)
    counterU8++
    Assert.equals(2, counterU8)
    counterU8--
    Assert.equals(1, counterU8)
}

