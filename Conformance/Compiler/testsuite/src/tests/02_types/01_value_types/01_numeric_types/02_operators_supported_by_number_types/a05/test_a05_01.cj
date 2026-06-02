/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a05_01

  @Level:         1
  @Assertion:       2.1.1.2(5) If arithmetic operators are not overload (see section operator overloading), the operands
                    of them must have the same type.

  @Description:     Check that the operators work on the same type.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    Assert.equals(-10, 61i64 + -71i64)
    Assert.equals(70, -20i64 - -90i64)
    Assert.equals(-561, -33i64 * 17i64)
    Assert.equals(-1, 67 / -66i64)
    Assert.equals(31, 31 % -90i64)

    Assert.equals(188, 88u64 + 100u64)
    Assert.equals(61, 77u64 - 16u64)
    Assert.equals(2912, 56u64 * 52u64)
    Assert.equals(1, 81u64 / 49u64)
    Assert.equals(0, 36u64 % 6u64)

    Assert.equals(60, -21i32 + 81i32)
    Assert.equals(174, 89i32 - -85i32)
    Assert.equals(-308, -11i32 * 28i32)
    Assert.equals(-1, -68i32 / 56i32)
    Assert.equals(56, 56i32 % 86i32)

    Assert.equals(160, 71u32 + 89u32)
    Assert.equals(68, 95u32 - 27u32)
    Assert.equals(4672, 73u32 * 64u32)
    Assert.equals(4, 74u32 / 15u32)
    Assert.equals(12, 54u32 % 14u32)

    Assert.equals(-93, -76i16 + -17i16)
    Assert.equals(-144, -47i16 - 97i16)
    Assert.equals(-1980, 55i16 * -36i16)
    Assert.equals(0, 66i16 / -95i16)
    Assert.equals(57, 57i16 % 92i16)

    Assert.equals(147, 55u16 + 92u16)
    Assert.equals(0, 84u16 - 84u16)
    Assert.equals(376, 47u16 * 8u16)
    Assert.equals(0, 28u16 / 60u16)
    Assert.equals(0, 100u16 % 25u16)

    Assert.equals(-93, -76i8 + -17i8)
    Assert.equals(-56, -47i8 - 9i8)
    Assert.equals(-15, 5i8 * -3i8)
    Assert.equals(0, 66i8 / -95i8)
    Assert.equals(57, 57i8 % 92i8)

    Assert.equals(147, 55u8 + 92u8)
    Assert.equals(0, 84u8 - 84u8)
    Assert.equals(32, 4u8 * 8u8)
    Assert.equals(0, 28u8 / 60u8)
    Assert.equals(0, 100u8 % 25u8)

    Assert.equals(-93, IntNative(-76) + IntNative(-17))
    Assert.equals(-144, IntNative(-47) - IntNative(97))
    Assert.equals(-1980, IntNative(55) * IntNative(-36))
    Assert.equals(0, IntNative(66) / IntNative(-95))
    Assert.equals(57, IntNative(57) % IntNative(92))

    Assert.equals(147, UIntNative(55) + UIntNative(92))
    Assert.equals(0, UIntNative(84) - UIntNative(84))
    Assert.equals(376, UIntNative(47) * UIntNative(8))
    Assert.equals(0, UIntNative(28) / UIntNative(60))
    Assert.equals(0, UIntNative(100) % UIntNative(25))

    Assert.approxEquals(49.09, 64.88f64 + -15.79f64)
    Assert.approxEquals(-114.52, -89.22f64 - 25.3f64)
    Assert.approxEquals(9074.19, -92.49f64 * -98.11f64)
    Assert.approxEquals(1.68551, 42.93f64 / 25.47f64)

    Assert.approxEquals(49.1, 64.8f32 + -15.7f32)
    Assert.approxEquals(-114.5, -89.2f32 - 25.3f32)
    Assert.approxEquals(9064.44, -92.4f32 * -98.1f32)
    Assert.approxEquals(1.688976377952756, 42.9f32 / 25.4f32)

    Assert.approxEquals(49.0, 64.0f16 + -15.0f16)
    Assert.approxEquals(-114.0, -89.0f16 - 25.0f16)
    Assert.approxEquals(9016.0, -92.0f16 * -98.0f16)
    Assert.approxEquals(21.0, 42.0f16 / 2.0f16)
}
