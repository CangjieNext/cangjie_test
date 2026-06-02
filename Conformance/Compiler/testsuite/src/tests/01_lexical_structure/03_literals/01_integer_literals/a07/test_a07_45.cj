/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_01_a07_45

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

  @Description:     Check positive cases for `HexadecimalLiteral IntegerLiteralSuffix?` with the 'i64' suffix.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    var a = 0x0i64
    a = 0x1i64
    a = 0x2i64
    a = 0x3i64
    a = 0x4i64
    a = 0x5i64
    a = 0x6i64
    a = 0x7i64
    a = 0x8i64
    a = 0x9i64
    a = 0xai64
    a = 0xbi64
    a = 0xci64
    a = 0xdi64
    a = 0xei64
    a = 0xfi64
    a = 0xAi64
    a = 0xBi64
    a = 0xCi64
    a = 0xDi64
    a = 0xEi64
    a = 0xFi64
    a = 0X0i64
    a = 0X1i64
    a = 0X2i64
    a = 0X3i64
    a = 0X4i64
    a = 0X5i64
    a = 0X6i64
    a = 0X7i64
    a = 0X8i64
    a = 0X9i64
    a = 0Xai64
    a = 0Xbi64
    a = 0Xci64
    a = 0Xdi64
    a = 0Xei64
    a = 0Xfi64
    a = 0XAi64
    a = 0XBi64
    a = 0XCi64
    a = 0XDi64
    a = 0XEi64
    a = 0XFi64

    a = 0x00i64
    a = 0xa0i64
    a = 0xA0i64
    a = 0X00i64
    a = 0Xa0i64
    a = 0XF0i64
    a = 0x09i64
    a = 0xa9i64
    a = 0xA9i64
    a = 0X09i64
    a = 0Xa9i64
    a = 0XF9i64
    a = 0x0ai64
    a = 0xaai64
    a = 0xAai64
    a = 0X0ai64
    a = 0Xaai64
    a = 0XFai64
    a = 0x0fi64
    a = 0xafi64
    a = 0xAfi64
    a = 0X0fi64
    a = 0Xafi64
    a = 0XFfi64
    a = 0x0Ai64
    a = 0xaAi64
    a = 0xAAi64
    a = 0X0Ai64
    a = 0XaAi64
    a = 0XFAi64
    a = 0x0Fi64
    a = 0xaFi64
    a = 0xAFi64
    a = 0X0Fi64
    a = 0XaFi64
    a = 0XFFi64
    a = 0x0_i64
    a = 0xa_i64
    a = 0xA_i64
    a = 0X0_i64
    a = 0Xa_i64
    a = 0XF_i64

    a = 0x000i64
    a = 0x0009i64
    a = 0x000ai64
    a = 0x000fi64
    a = 0x000Ai64
    a = 0x000Fi64
    a = 0x000_i64
    a = 0xaA0i64
    a = 0xaA9i64
    a = 0xaAai64
    a = 0xaAfi64
    a = 0xaAAi64
    a = 0xaAFi64
    a = 0xaA_i64
    a = 0XF_0i64
    a = 0XF_9i64
    a = 0Xa_ai64
    a = 0xF_fi64
    a = 0xF_Ai64
    a = 0Xf_Fi64
    a = 0Xf__i64
    a = 0Xf_F_i64
    a = 0Xf_F_1i64

    Assert.equals(170, 0xaA_i64)
    Assert.equals(0, 0x000_i64)
    Assert.equals(0, 0x000i64)
    Assert.equals(2735, 0xaAFi64)
    Assert.equals(2735, 0XaAFi64)
    Assert.equals(2735, 0Xaafi64)
    Assert.equals(2735, 0xAAFi64)
    Assert.equals(240, 0XF_0i64)
    Assert.equals(250, 0XF_ai64)
    Assert.equals(15, 0Xf__i64)
    Assert.equals(255, 0Xf_F_i64)
    Assert.equals(4081, 0Xf_F_1i64)
}
