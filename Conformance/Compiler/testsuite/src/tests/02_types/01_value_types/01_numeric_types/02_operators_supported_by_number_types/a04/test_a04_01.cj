/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a04_01

  @Level:         1
  @Assertion:       2.1.1.2(4) Arithmetic operators include addition (+), subtraction (-), multiplication (*),
                    division (/), reminder (%), and power (**).

  @Description:     Check the listed operators for all number types.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    Assert.equals(-10, 61 + (-71))
    Assert.equals(70, -20 - (-90))
    Assert.equals(-561, -33 * 17)
    Assert.equals(-1, 67 / (-66))
    Assert.equals(31, 31 % (-90))

    
    Assert.equals(188, 88u64 + 100)
    Assert.equals(61, 77u64 - 16)
    Assert.equals(2912, 56u64 * 52)
    Assert.equals(1, 81u64 / 49)
    Assert.equals(0, 36u64 % 6)

    Assert.equals(60, -21i32 + 81)
    Assert.equals(174, 89i32 - (-85))
    Assert.equals(-308, -11i32 * 28)
    Assert.equals(-1, -68i32 / 56)
    Assert.equals(56, 56i32 % 86)

    Assert.equals(160, 71u32 + 89)
    Assert.equals(68, 95u32 - 27)
    Assert.equals(4672, 73u32 * 64)
    Assert.equals(4, 74u32 / 15)
    Assert.equals(12, 54u32 % 14)

    Assert.equals(-93, -76i16 + -17)
    Assert.equals(-144, -47i16 - 97)
    Assert.equals(-1980, 55i16 * (-36))
    Assert.equals(0, 66i16 / (-95))
    Assert.equals(57, 57i16 % 92)

    Assert.equals(147, 55u16 + 92)
    Assert.equals(0, 84u16 - 84)
    Assert.equals(376, 47u16 * 8)
    Assert.equals(0, 28u16 / 60)
    Assert.equals(0, 100u16 % 25)

    Assert.equals(-93, -76i8 + -17)
    Assert.equals(-56, -47i8 - 9)
    Assert.equals(-15, 5i8 * (-3))
    Assert.equals(0, 66i8 / (-95))
    Assert.equals(57, 57i8 % 92)

    Assert.equals(147, 55u8 + 92)
    Assert.equals(0, 84u8 - 84)
    Assert.equals(32, 4u8 * 8)
    Assert.equals(0, 28u8 / 60)
    Assert.equals(0, 100u8 % 25)

    Assert.equals(-93, IntNative(-76) + -17)
    Assert.equals(-144, IntNative(-47) - 97)
    Assert.equals(-1980, IntNative(55) * (-36))
    Assert.equals(0, IntNative(66) / (-95))
    Assert.equals(57, IntNative(57) % 92)

    Assert.equals(147, UIntNative(55) + 92)
    Assert.equals(0, UIntNative(84) - 84)
    Assert.equals(376, UIntNative(47) * 8)
    Assert.equals(0, UIntNative(28) / 60)
    Assert.equals(0, UIntNative(100) % 25)

    Assert.approxEquals(49.09, 64.88 + (-15.79))
    Assert.approxEquals(-114.52, -89.22 - 25.3)
    Assert.approxEquals(9074.19, -92.49 * (-98.11))
    Assert.approxEquals(1.68551, 42.93 / 25.47)

    Assert.approxEquals(49.1, 64.8f32 + (-15.7))
    Assert.approxEquals(-114.5, -89.2f32 - 25.3)
    Assert.approxEquals(9064.44, -92.4f32 * (-98.1))
    Assert.approxEquals(1.688976377952756, 42.9f32 / 25.4)

    Assert.approxEquals(49.0, 64.0f16 + (-15.0))
    Assert.approxEquals(-114.0, -89.0f16 - 25.0)
    Assert.approxEquals(9016.0, -92.0f16 * (-98.0))
    Assert.approxEquals(21.0, 42.0f16 / 2.0)

    Assert.equals(10000000000000000, 10 ** 16)
    Assert.approxEquals(17.5239350485, 74.97 ** 0.66331)
}
