/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_01_a07_41

  @Level:         1

  @Assertion:       1.3.1(7) The syntax of integer literals is:
                       IntegerLiteralSuffix
                          : 'i8' |'i16' |'i32' |'i64' |'u8' |'u16' |'u32' | 'u64'
                          ;
                       IntegerLiteral
                          : BinaryLiteral IntegerLiteralSuffix?
                          | OctalLiteral IntegerLiteralSuffix?
                          | DecimalLiteral '_'* IntegerLiteralSuffix?
                          | HexadecimalLiteral IntegerLiteralSuffix?
                          ;
                       BinaryLiteral
                           : '0' [bB] BinDigit (BinDigit | '_')*
                           ;
                       BinDigit
                           : [01]
                           ;
                       OctalLiteral
                           : '0' [oO] OctalDigit (OctalDigit | '_')*
                           ;
                       OctalDigit
                           : [0-7]
                           ;
                       DecimalLiteral
                           ([1-9] (DecimalDigit | '_')*) | DecimalDigit
                           ;
                       DecimalDigit
                           : [0-9]
                           ;
                       HexadecimalLiteral
                           : '0' [xX] HexadecimalDigits
                           ;
                       HexadecimalDigits
                           : HexadecimalDigit (HexadecimalDigit | '_')*
                           ;
                       HexadecimalDigit
                           : [0-9a-fA-F]
                           ;

  @Description:     Check positive cases for `HexadecimalLiteral IntegerLiteralSuffix?` without suffixes.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    var a = 0x0
    a = 0x1
    a = 0x2
    a = 0x3
    a = 0x4
    a = 0x5
    a = 0x6
    a = 0x7
    a = 0x8
    a = 0x9
    a = 0xa
    a = 0xb
    a = 0xc
    a = 0xd
    a = 0xe
    a = 0xf
    a = 0xA
    a = 0xB
    a = 0xC
    a = 0xD
    a = 0xE
    a = 0xF
    a = 0X0
    a = 0X1
    a = 0X2
    a = 0X3
    a = 0X4
    a = 0X5
    a = 0X6
    a = 0X7
    a = 0X8
    a = 0X9
    a = 0Xa
    a = 0Xb
    a = 0Xc
    a = 0Xd
    a = 0Xe
    a = 0Xf
    a = 0XA
    a = 0XB
    a = 0XC
    a = 0XD
    a = 0XE
    a = 0XF

    a = 0x00
    a = 0xa0
    a = 0xA0
    a = 0X00
    a = 0Xa0
    a = 0XF0
    a = 0x09
    a = 0xa9
    a = 0xA9
    a = 0X09
    a = 0Xa9
    a = 0XF9
    a = 0x0a
    a = 0xaa
    a = 0xAa
    a = 0X0a
    a = 0Xaa
    a = 0XFa
    a = 0x0f
    a = 0xaf
    a = 0xAf
    a = 0X0f
    a = 0Xaf
    a = 0XFf
    a = 0x0A
    a = 0xaA
    a = 0xAA
    a = 0X0A
    a = 0XaA
    a = 0XFA
    a = 0x0F
    a = 0xaF
    a = 0xAF
    a = 0X0F
    a = 0XaF
    a = 0XFF
    a = 0x0_
    a = 0xa_
    a = 0xA_
    a = 0X0_
    a = 0Xa_
    a = 0XF_

    a = 0x000
    a = 0x0009
    a = 0x000a
    a = 0x000f
    a = 0x000A
    a = 0x000F
    a = 0x000_
    a = 0xaA0
    a = 0xaA9
    a = 0xaAa
    a = 0xaAf
    a = 0xaAA
    a = 0xaAF
    a = 0xaA_
    a = 0XF_0
    a = 0XF_9
    a = 0Xa_a
    a = 0xF_f
    a = 0xF_A
    a = 0Xf_F
    a = 0Xf__
    a = 0Xf_F_
    a = 0Xf_F_1

    Assert.equals(170, 0xaA_)
    Assert.equals(0, 0x000_)
    Assert.equals(0, 0x000)
    Assert.equals(2735, 0xaAF)
    Assert.equals(2735, 0XaAF)
    Assert.equals(2735, 0Xaaf)
    Assert.equals(2735, 0xAAF)
    Assert.equals(240, 0XF_0)
    Assert.equals(250, 0XF_a)
    Assert.equals(15, 0Xf__)
    Assert.equals(255, 0Xf_F_)
    Assert.equals(4081, 0Xf_F_1)
}
