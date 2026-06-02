
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_19_a02_01

  @Level:         1

  @Assertion:   4.19(2) Range expressions are used to create Range instances.
  @Description: Checks that range expressions with boundaries of type T have type Range<T>. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue((0i8..10i8) is Range<Int8>)
    Assert.isTrue((0u8..10u8) is Range<UInt8>)
    Assert.isTrue((0i16..10i16) is Range<Int16>)
    Assert.isTrue((0u16..10u16) is Range<UInt16>)
    Assert.isTrue((0i32..10i32) is Range<Int32>)
    Assert.isTrue((0u32..10u32) is Range<UInt32>)
    Assert.isTrue((0i64..10i64) is Range<Int64>)
    Assert.isTrue((0u64..10u64) is Range<UInt64>)

    Assert.isTrue((0i8..=10i8) is Range<Int8>)
    Assert.isTrue((0u8..=10u8) is Range<UInt8>)
    Assert.isTrue((0i16..=10i16) is Range<Int16>)
    Assert.isTrue((0u16..=10u16) is Range<UInt16>)
    Assert.isTrue((0i32..=10i32) is Range<Int32>)
    Assert.isTrue((0u32..=10u32) is Range<UInt32>)
    Assert.isTrue((0i64..=10i64) is Range<Int64>)
    Assert.isTrue((0u64..=10u64) is Range<UInt64>)
}
