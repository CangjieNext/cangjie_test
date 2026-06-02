/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a08_01

  @Level:         1
  @Assertion:       2.1.1.2(8) Bitwise operators include bitwise not (!), bitwise left shift (<<), bitwise right
                    shift (>>), bitwise and (&), bitwise xor (^), and bit or (|). For details about precedence, see the
                    description of bitwise expressions in Chapter 4.

  @Description:     Check that the listed operators work as expected for all possible types.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    Assert.equals(-0x1, !0i8)
    Assert.equals(0xfe, !1u8)
    Assert.equals(-3, !2i16)
    Assert.equals(0xfffb, !4u16)
    Assert.equals(-6, !5i32)
    Assert.equals(0xfffffff9, !6u32)
    Assert.equals(6, !-7i64)
    Assert.equals(8, !!8u64)

    Assert.equals(2, 1i8 << 1u8)
    Assert.equals(4, 1u16 << 2i16)
    Assert.equals(8, 1i32 << 3u32)
    Assert.equals(16, 1u64 << 4i64)

    Assert.equals(64, 128u8 >> 1i8)
    Assert.equals(4096, 16384i16 >> 2u16)
    Assert.equals(4096, 32768u32 >> 3i32)
    Assert.equals(2048, 32768i64 >> 4u64)

    Assert.equals(0, 0i8 & 1)
    Assert.equals(0, 1u8 & 2)
    Assert.equals(2, 2i16 & 3)
    Assert.equals(0, 3u16 & 4)
    Assert.equals(4, 4i32 & 5)
    Assert.equals(4, 5u32 & 6)
    Assert.equals(6, 6i64 & -1)
    Assert.equals(6, 6u64 & 7)

    Assert.equals(15, 7i8 ^ 8)
    Assert.equals(1, 8u8 ^ 9)
    Assert.equals(3, 9i16 ^ 10)
    Assert.equals(1, 10u16 ^ 11)
    Assert.equals(7, 11i32 ^ 12)
    Assert.equals(1, 12u32 ^ 13)
    Assert.equals(3, 13i64 ^ 14)
    Assert.equals(1, 14u64 ^ 15)

    Assert.equals(17, 16i8 | 17)
    Assert.equals(19, 17u8 | 18)
    Assert.equals(19, 18i16 | 19)
    Assert.equals(23, 19u16 | 20)
    Assert.equals(21, 20i32 | 21)
    Assert.equals(23, 21u32 | 22)
    Assert.equals(23, 22i64 | 23)
    Assert.equals(31, 23u64 | 24)

    Assert.equals(-1, !IntNative(0))
    Assert.equals(4, IntNative(1) << 2)
    Assert.equals(4, IntNative(16) >> 2)
    Assert.equals(6, IntNative(6) & 7)
    Assert.equals(1, IntNative(6) ^ 7)
    Assert.equals(7, IntNative(6) | 7)

    Assert.equals(0, !!UIntNative(0))
    Assert.equals(4, UIntNative(1) << 2)
    Assert.equals(4, UIntNative(16) >> 2)
    Assert.equals(6, UIntNative(6) & 7)
    Assert.equals(1, UIntNative(6) ^ 7)
    Assert.equals(7, UIntNative(6) | 7)
}
