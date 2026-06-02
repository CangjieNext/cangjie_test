
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_04

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks value and type of the integer literals which starts with 0x. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var i1 = 0x11
    Assert.equals(17, i1)
    Assert.isTrue(i1 is Int64)

    var i2 = 0x11i8
    Assert.equals(17, i2)
    Assert.isTrue(i2 is Int8)

    var i3 = 0x11i16
    Assert.equals(17, i3)
    Assert.isTrue(i3 is Int16)

    var i4 = 0x11i32
    Assert.equals(17, i4)
    Assert.isTrue(i4 is Int32)

    var i5 = 0x11i64
    Assert.equals(17, i5)
    Assert.isTrue(i5 is Int64)

    var i6 = 0x11u8
    Assert.equals(17, i6)
    Assert.isTrue(i6 is UInt8)

    var i7 = 0x11u16
    Assert.equals(17, i7)
    Assert.isTrue(i7 is UInt16)

    var i8 = 0x1111u32
    Assert.equals(4369, i8)
    Assert.isTrue(i8 is UInt32)

    var i9 = 0x1111u64
    Assert.equals(4369, i9)
    Assert.isTrue(i9 is UInt64)
}