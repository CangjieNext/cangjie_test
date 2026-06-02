/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_01_a07_46

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

  @Description:     Check positive cases for `HexadecimalLiteral IntegerLiteralSuffix?` with the 'u8' suffix.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    var a = 0x0u8
    a = 0x1u8
    a = 0x2u8
    a = 0x3u8
    a = 0x4u8
    a = 0x5u8
    a = 0x6u8
    a = 0x7u8
    a = 0x8u8
    a = 0x9u8
    a = 0xau8
    a = 0xbu8
    a = 0xcu8
    a = 0xdu8
    a = 0xeu8
    a = 0xfu8
    a = 0xAu8
    a = 0xBu8
    a = 0xCu8
    a = 0xDu8
    a = 0xEu8
    a = 0xFu8
    a = 0X0u8
    a = 0X1u8
    a = 0X2u8
    a = 0X3u8
    a = 0X4u8
    a = 0X5u8
    a = 0X6u8
    a = 0X7u8
    a = 0X8u8
    a = 0X9u8
    a = 0Xau8
    a = 0Xbu8
    a = 0Xcu8
    a = 0Xdu8
    a = 0Xeu8
    a = 0Xfu8
    a = 0XAu8
    a = 0XBu8
    a = 0XCu8
    a = 0XDu8
    a = 0XEu8
    a = 0XFu8

    a = 0x00u8
    a = 0xa0u8
    a = 0xA0u8
    a = 0X00u8
    a = 0Xa0u8
    a = 0XF0u8
    a = 0x09u8
    a = 0xa9u8
    a = 0xA9u8
    a = 0X09u8
    a = 0Xa9u8
    a = 0XF9u8
    a = 0x0au8
    a = 0xaau8
    a = 0xAau8
    a = 0X0au8
    a = 0Xaau8
    a = 0XFau8
    a = 0x0fu8
    a = 0xafu8
    a = 0xAfu8
    a = 0X0fu8
    a = 0Xafu8
    a = 0XFfu8
    a = 0x0Au8
    a = 0xaAu8
    a = 0xAAu8
    a = 0X0Au8
    a = 0XaAu8
    a = 0XFAu8
    a = 0x0Fu8
    a = 0xaFu8
    a = 0xAFu8
    a = 0X0Fu8
    a = 0XaFu8
    a = 0XFFu8
    a = 0x0_u8
    a = 0xa_u8
    a = 0xA_u8
    a = 0X0_u8
    a = 0Xa_u8
    a = 0XF_u8

    a = 0x000u8
    a = 0x0009u8
    a = 0x000au8
    a = 0x000fu8
    a = 0x000Au8
    a = 0x000Fu8
    a = 0x000_u8
    a = 0xaA_u8
    a = 0XF_0u8
    a = 0XF_9u8
    a = 0Xa_au8
    a = 0xF_fu8
    a = 0xF_Au8
    a = 0Xf_Fu8
    a = 0Xf__u8
    a = 0Xf_F_u8

    Assert.equals(170, 0xaa_u8)
    Assert.equals(170, 0xaA_u8)
    Assert.equals(170, 0xAa_u8)
    Assert.equals(170, 0xAA_u8)
    Assert.equals(170, 0Xaa_u8)
    Assert.equals(170, 0XaA_u8)
    Assert.equals(170, 0XAa_u8)
    Assert.equals(170, 0XAA_u8)
    Assert.equals(0, 0x000_u8)
    Assert.equals(9, 0x009u8)
    Assert.equals(240, 0XF_0u8)
    Assert.equals(250, 0XF_au8)
    Assert.equals(15, 0Xf__u8)
    Assert.equals(255, 0Xf_F_u8)
}
