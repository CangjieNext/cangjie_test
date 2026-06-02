/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_01_a07_44

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

  @Description:     Check positive cases for `HexadecimalLiteral IntegerLiteralSuffix?` with the 'i32' suffix.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    var a = 0x0i32
    a = 0x1i32
    a = 0x2i32
    a = 0x3i32
    a = 0x4i32
    a = 0x5i32
    a = 0x6i32
    a = 0x7i32
    a = 0x8i32
    a = 0x9i32
    a = 0xai32
    a = 0xbi32
    a = 0xci32
    a = 0xdi32
    a = 0xei32
    a = 0xfi32
    a = 0xAi32
    a = 0xBi32
    a = 0xCi32
    a = 0xDi32
    a = 0xEi32
    a = 0xFi32
    a = 0X0i32
    a = 0X1i32
    a = 0X2i32
    a = 0X3i32
    a = 0X4i32
    a = 0X5i32
    a = 0X6i32
    a = 0X7i32
    a = 0X8i32
    a = 0X9i32
    a = 0Xai32
    a = 0Xbi32
    a = 0Xci32
    a = 0Xdi32
    a = 0Xei32
    a = 0Xfi32
    a = 0XAi32
    a = 0XBi32
    a = 0XCi32
    a = 0XDi32
    a = 0XEi32
    a = 0XFi32

    a = 0x00i32
    a = 0xa0i32
    a = 0xA0i32
    a = 0X00i32
    a = 0Xa0i32
    a = 0XF0i32
    a = 0x09i32
    a = 0xa9i32
    a = 0xA9i32
    a = 0X09i32
    a = 0Xa9i32
    a = 0XF9i32
    a = 0x0ai32
    a = 0xaai32
    a = 0xAai32
    a = 0X0ai32
    a = 0Xaai32
    a = 0XFai32
    a = 0x0fi32
    a = 0xafi32
    a = 0xAfi32
    a = 0X0fi32
    a = 0Xafi32
    a = 0XFfi32
    a = 0x0Ai32
    a = 0xaAi32
    a = 0xAAi32
    a = 0X0Ai32
    a = 0XaAi32
    a = 0XFAi32
    a = 0x0Fi32
    a = 0xaFi32
    a = 0xAFi32
    a = 0X0Fi32
    a = 0XaFi32
    a = 0XFFi32
    a = 0x0_i32
    a = 0xa_i32
    a = 0xA_i32
    a = 0X0_i32
    a = 0Xa_i32
    a = 0XF_i32

    a = 0x000i32
    a = 0x0009i32
    a = 0x000ai32
    a = 0x000fi32
    a = 0x000Ai32
    a = 0x000Fi32
    a = 0x000_i32
    a = 0xaA0i32
    a = 0xaA9i32
    a = 0xaAai32
    a = 0xaAfi32
    a = 0xaAAi32
    a = 0xaAFi32
    a = 0xaA_i32
    a = 0XF_0i32
    a = 0XF_9i32
    a = 0Xa_ai32
    a = 0xF_fi32
    a = 0xF_Ai32
    a = 0Xf_Fi32
    a = 0Xf__i32
    a = 0Xf_F_i32
    a = 0Xf_F_1i32

    Assert.equals(170, 0xaA_i32)
    Assert.equals(0, 0x000_i32)
    Assert.equals(0, 0x000i32)
    Assert.equals(2735, 0xaAFi32)
    Assert.equals(2735, 0XaAFi32)
    Assert.equals(2735, 0Xaafi32)
    Assert.equals(2735, 0xAAFi32)
    Assert.equals(240, 0XF_0i32)
    Assert.equals(250, 0XF_ai32)
    Assert.equals(15, 0Xf__i32)
    Assert.equals(255, 0Xf_F_i32)
    Assert.equals(4081, 0Xf_F_1i32)
}
