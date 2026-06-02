/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_01_a07_13

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

  @Description:     Check positive cases for `DecimalLiteral '_'* IntegerLiteralSuffix?` with the 'i64' suffix.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    var a = 1i64
    a = 2i64
    a = 3i64
    a = 4i64
    a = 5i64
    a = 6i64
    a = 8i64
    a = 9i64
    a = 10i64
    a = 11i64
    a = 12i64
    a = 13i64
    a = 19i64
    a = 1_i64
    a = 100i64
    a = 101i64
    a = 102i64
    a = 109i64
    a = 10_i64
    a = 110i64
    a = 111i64
    a = 119i64
    a = 11_i64
    a = 190i64
    a = 199i64
    a = 19_i64
    a = 1_0i64
    a = 1_1i64
    a = 1_2i64
    a = 1_3i64
    a = 1_4i64
    a = 1_5i64
    a = 1_6i64
    a = 1_7i64
    a = 1_8i64
    a = 1_9i64
    a = 1__i64
    a = 0i64

    a = 2_i64
    a = 3_i64
    a = 4_i64
    a = 5_i64
    a = 6_i64
    a = 8_i64
    a = 9_i64
    a = 12_i64
    a = 13_i64
    a = 100_i64
    a = 101_i64
    a = 102_i64
    a = 109_i64
    a = 10__i64
    a = 110_i64
    a = 111_i64
    a = 119_i64
    a = 11__i64
    a = 190_i64
    a = 199_i64
    a = 19__i64
    a = 1_0_i64
    a = 1_1_i64
    a = 1_2_i64
    a = 1_3_i64
    a = 1_4_i64
    a = 1_5_i64
    a = 1_6_i64
    a = 1_7_i64
    a = 1_8_i64
    a = 1_9_i64
    a = 1___i64
    a = 0_i64

    Assert.equals(9, 9i64)
    Assert.equals(1, 1_i64)
    Assert.equals(10, 1_0i64)
    Assert.equals(1, 1__i64)
    Assert.equals(2, 2_i64)
    Assert.equals(101, 101_i64)
    Assert.equals(10, 1_0_i64)
    Assert.equals(0, 0_i64)
}
