/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_01_a07_43

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

  @Description:     Check positive cases for `HexadecimalLiteral IntegerLiteralSuffix?` with the 'i16' suffix.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    var a = 0x0i16
    a = 0x1i16
    a = 0x2i16
    a = 0x3i16
    a = 0x4i16
    a = 0x5i16
    a = 0x6i16
    a = 0x7i16
    a = 0x8i16
    a = 0x9i16
    a = 0xai16
    a = 0xbi16
    a = 0xci16
    a = 0xdi16
    a = 0xei16
    a = 0xfi16
    a = 0xAi16
    a = 0xBi16
    a = 0xCi16
    a = 0xDi16
    a = 0xEi16
    a = 0xFi16
    a = 0X0i16
    a = 0X1i16
    a = 0X2i16
    a = 0X3i16
    a = 0X4i16
    a = 0X5i16
    a = 0X6i16
    a = 0X7i16
    a = 0X8i16
    a = 0X9i16
    a = 0Xai16
    a = 0Xbi16
    a = 0Xci16
    a = 0Xdi16
    a = 0Xei16
    a = 0Xfi16
    a = 0XAi16
    a = 0XBi16
    a = 0XCi16
    a = 0XDi16
    a = 0XEi16
    a = 0XFi16

    a = 0x00i16
    a = 0xa0i16
    a = 0xA0i16
    a = 0X00i16
    a = 0Xa0i16
    a = 0XF0i16
    a = 0x09i16
    a = 0xa9i16
    a = 0xA9i16
    a = 0X09i16
    a = 0Xa9i16
    a = 0XF9i16
    a = 0x0ai16
    a = 0xaai16
    a = 0xAai16
    a = 0X0ai16
    a = 0Xaai16
    a = 0XFai16
    a = 0x0fi16
    a = 0xafi16
    a = 0xAfi16
    a = 0X0fi16
    a = 0Xafi16
    a = 0XFfi16
    a = 0x0Ai16
    a = 0xaAi16
    a = 0xAAi16
    a = 0X0Ai16
    a = 0XaAi16
    a = 0XFAi16
    a = 0x0Fi16
    a = 0xaFi16
    a = 0xAFi16
    a = 0X0Fi16
    a = 0XaFi16
    a = 0XFFi16
    a = 0x0_i16
    a = 0xa_i16
    a = 0xA_i16
    a = 0X0_i16
    a = 0Xa_i16
    a = 0XF_i16

    a = 0x000i16
    a = 0x0009i16
    a = 0x000ai16
    a = 0x000fi16
    a = 0x000Ai16
    a = 0x000Fi16
    a = 0x000_i16
    a = 0xaA0i16
    a = 0xaA9i16
    a = 0xaAai16
    a = 0xaAfi16
    a = 0xaAAi16
    a = 0xaAFi16
    a = 0xaA_i16
    a = 0XF_0i16
    a = 0XF_9i16
    a = 0Xa_ai16
    a = 0xF_fi16
    a = 0xF_Ai16
    a = 0Xf_Fi16
    a = 0Xf__i16
    a = 0Xf_F_i16
    a = 0Xf_F_1i16

    Assert.equals(170, 0xaA_i16)
    Assert.equals(0, 0x000_i16)
    Assert.equals(0, 0x000i16)
    Assert.equals(2735, 0xaAFi16)
    Assert.equals(2735, 0XaAFi16)
    Assert.equals(2735, 0Xaafi16)
    Assert.equals(2735, 0xAAFi16)
    Assert.equals(240, 0XF_0i16)
    Assert.equals(250, 0XF_ai16)
    Assert.equals(15, 0Xf__i16)
    Assert.equals(255, 0Xf_F_i16)
    Assert.equals(4081, 0Xf_F_1i16)
}
