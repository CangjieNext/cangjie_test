/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_01_a07_42

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

  @Description:     Check positive cases for `HexadecimalLiteral IntegerLiteralSuffix?` with the 'i8' suffix.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    var a = 0x0i8
    a = 0x1i8
    a = 0x2i8
    a = 0x3i8
    a = 0x4i8
    a = 0x5i8
    a = 0x6i8
    a = 0x7i8
    a = 0x8i8
    a = 0x9i8
    a = 0xai8
    a = 0xbi8
    a = 0xci8
    a = 0xdi8
    a = 0xei8
    a = 0xfi8
    a = 0xAi8
    a = 0xBi8
    a = 0xCi8
    a = 0xDi8
    a = 0xEi8
    a = 0xFi8
    a = 0X0i8
    a = 0X1i8
    a = 0X2i8
    a = 0X3i8
    a = 0X4i8
    a = 0X5i8
    a = 0X6i8
    a = 0X7i8
    a = 0X8i8
    a = 0X9i8
    a = 0Xai8
    a = 0Xbi8
    a = 0Xci8
    a = 0Xdi8
    a = 0Xei8
    a = 0Xfi8
    a = 0XAi8
    a = 0XBi8
    a = 0XCi8
    a = 0XDi8
    a = 0XEi8
    a = 0XFi8

    a = 0x00i8
    a = 0x70i8
    a = 0x7ai8
    a = 0x7Ai8
    a = 0x7fi8
    a = 0x7Fi8
    a = 0X7ai8
    a = 0X7Ai8
    a = 0X7fi8
    a = 0X7Fi8
    a = 0x09i8
    a = 0X0ai8
    a = 0x0ai8
    a = 0x0fi8
    a = 0X0Fi8
    a = 0x0Ai8
    a = 0X0Ai8
    a = 0x0Fi8
    a = 0X0Fi8
    a = 0x0_i8
    a = 0xa_i8
    a = 0xA_i8
    a = 0Xa_i8
    a = 0XF_i8

    a = 0x000i8
    a = 0x0009i8
    a = 0x000ai8
    a = 0x000fi8
    a = 0x000Ai8
    a = 0x000Fi8
    a = 0x000_i8
    a = 0x7A_i8
    a = 0X7_0i8
    a = 0X7_9i8
    a = 0X7_ai8
    a = 0x7_fi8
    a = 0x7_Ai8
    a = 0X7_Fi8
    a = 0X7__i8
    a = 0X7_F_i8

    Assert.equals(122, 0x7a_i8)
    Assert.equals(122, 0x7A_i8)
    Assert.equals(122, 0x7a_i8)
    Assert.equals(122, 0x7A_i8)
    Assert.equals(122, 0X7a_i8)
    Assert.equals(122, 0X7A_i8)
    Assert.equals(122, 0X7a_i8)
    Assert.equals(122, 0X7A_i8)
    Assert.equals(0, 0x000_i8)
    Assert.equals(9, 0x009i8)
    Assert.equals(112, 0X7_0i8)
    Assert.equals(122, 0X7_ai8)
    Assert.equals(15, 0Xf__i8)
    Assert.equals(127, 0X7_F_i8)
}
