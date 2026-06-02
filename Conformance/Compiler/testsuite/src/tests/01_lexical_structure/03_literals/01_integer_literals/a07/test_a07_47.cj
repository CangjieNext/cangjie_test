/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_01_a07_47

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

  @Description:     Check positive cases for `HexadecimalLiteral IntegerLiteralSuffix?` with the 'u16' suffix.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    var a = 0x0u16
    a = 0x1u16
    a = 0x2u16
    a = 0x3u16
    a = 0x4u16
    a = 0x5u16
    a = 0x6u16
    a = 0x7u16
    a = 0x8u16
    a = 0x9u16
    a = 0xau16
    a = 0xbu16
    a = 0xcu16
    a = 0xdu16
    a = 0xeu16
    a = 0xfu16
    a = 0xAu16
    a = 0xBu16
    a = 0xCu16
    a = 0xDu16
    a = 0xEu16
    a = 0xFu16
    a = 0X0u16
    a = 0X1u16
    a = 0X2u16
    a = 0X3u16
    a = 0X4u16
    a = 0X5u16
    a = 0X6u16
    a = 0X7u16
    a = 0X8u16
    a = 0X9u16
    a = 0Xau16
    a = 0Xbu16
    a = 0Xcu16
    a = 0Xdu16
    a = 0Xeu16
    a = 0Xfu16
    a = 0XAu16
    a = 0XBu16
    a = 0XCu16
    a = 0XDu16
    a = 0XEu16
    a = 0XFu16

    a = 0x00u16
    a = 0xa0u16
    a = 0xA0u16
    a = 0X00u16
    a = 0Xa0u16
    a = 0XF0u16
    a = 0x09u16
    a = 0xa9u16
    a = 0xA9u16
    a = 0X09u16
    a = 0Xa9u16
    a = 0XF9u16
    a = 0x0au16
    a = 0xaau16
    a = 0xAau16
    a = 0X0au16
    a = 0Xaau16
    a = 0XFau16
    a = 0x0fu16
    a = 0xafu16
    a = 0xAfu16
    a = 0X0fu16
    a = 0Xafu16
    a = 0XFfu16
    a = 0x0Au16
    a = 0xaAu16
    a = 0xAAu16
    a = 0X0Au16
    a = 0XaAu16
    a = 0XFAu16
    a = 0x0Fu16
    a = 0xaFu16
    a = 0xAFu16
    a = 0X0Fu16
    a = 0XaFu16
    a = 0XFFu16
    a = 0x0_u16
    a = 0xa_u16
    a = 0xA_u16
    a = 0X0_u16
    a = 0Xa_u16
    a = 0XF_u16

    a = 0x000u16
    a = 0x0009u16
    a = 0x000au16
    a = 0x000fu16
    a = 0x000Au16
    a = 0x000Fu16
    a = 0x000_u16
    a = 0xaA0u16
    a = 0xaA9u16
    a = 0xaAau16
    a = 0xaAfu16
    a = 0xaAAu16
    a = 0xaAFu16
    a = 0xaA_u16
    a = 0XF_0u16
    a = 0XF_9u16
    a = 0Xa_au16
    a = 0xF_fu16
    a = 0xF_Au16
    a = 0Xf_Fu16
    a = 0Xf__u16
    a = 0Xf_F_u16
    a = 0Xf_F_1u16

    Assert.equals(170, 0xaA_u16)
    Assert.equals(0, 0x000_u16)
    Assert.equals(0, 0x000u16)
    Assert.equals(2735, 0xaAFu16)
    Assert.equals(2735, 0XaAFu16)
    Assert.equals(2735, 0Xaafu16)
    Assert.equals(2735, 0xAAFu16)
    Assert.equals(240, 0XF_0u16)
    Assert.equals(250, 0XF_au16)
    Assert.equals(15, 0Xf__u16)
    Assert.equals(255, 0Xf_F_u16)
    Assert.equals(4081, 0Xf_F_1u16)
}
