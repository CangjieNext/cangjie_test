/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_03_a01_01

  @Level:         1
  @Assertion:       2.1.8.3(1) When defining Range<T> variables, the type annotation can be added
                    or omitted (inferred by the compiler in this situation).

  @Description:     Checks that range variables (var) have equal types.

  @Mode:            run
  @Negative:        no
  @Structure:       single

*/

import utils.assert.Assert

main() {
  var a1: Range<Int8>       = 0..10
  var a2: Range<Int16>      = -5..=10
  var a3: Range<Int32>      = 10..=10
  var a4: Range<Int64>      = 8..10:2
  var a5: Range<UInt8>      = 0..10
  var a6: Range<UInt16>     = 5..=10
  var a7: Range<UInt32>     = 12..=10
  var a8: Range<UInt64>     = 80..100:2

  var b1 = 0i8..10i8
  var b2 = -5i16..=10i16
  var b3 = 10i32..=10i32
  var b4 = 8i64..10i64:2
  var b5 = 0u8..10u8
  var b6 = 5u16..=10u16
  var b7 = 12u32..=10u32
  var b8 = 80u64..100u64:2

  Assert.equals(a1, b1)
  Assert.equals(a2, b2)
  Assert.equals(a3, b3)
  Assert.equals(a4, b4)
  Assert.equals(a5, b5)
  Assert.equals(a6, b6)
  Assert.equals(a7, b7)
  Assert.equals(a8, b8)
  return 0
}
