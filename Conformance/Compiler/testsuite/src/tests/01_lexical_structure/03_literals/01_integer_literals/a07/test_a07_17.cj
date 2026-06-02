/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_01_a07_17

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

  @Description:     Check positive cases for `DecimalLiteral '_'* IntegerLiteralSuffix?` with the 'u64' suffix.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    var a = 1u64
    a = 2u64
    a = 3u64
    a = 4u64
    a = 5u64
    a = 6u64
    a = 8u64
    a = 9u64
    a = 10u64
    a = 11u64
    a = 12u64
    a = 13u64
    a = 19u64
    a = 1_u64
    a = 100u64
    a = 101u64
    a = 102u64
    a = 109u64
    a = 10_u64
    a = 110u64
    a = 111u64
    a = 119u64
    a = 11_u64
    a = 190u64
    a = 199u64
    a = 19_u64
    a = 1_0u64
    a = 1_1u64
    a = 1_2u64
    a = 1_3u64
    a = 1_4u64
    a = 1_5u64
    a = 1_6u64
    a = 1_7u64
    a = 1_8u64
    a = 1_9u64
    a = 1__u64
    a = 0u64

    a = 2_u64
    a = 3_u64
    a = 4_u64
    a = 5_u64
    a = 6_u64
    a = 8_u64
    a = 9_u64
    a = 12_u64
    a = 13_u64
    a = 100_u64
    a = 101_u64
    a = 102_u64
    a = 109_u64
    a = 10__u64
    a = 110_u64
    a = 111_u64
    a = 119_u64
    a = 11__u64
    a = 190_u64
    a = 199_u64
    a = 19__u64
    a = 1_0_u64
    a = 1_1_u64
    a = 1_2_u64
    a = 1_3_u64
    a = 1_4_u64
    a = 1_5_u64
    a = 1_6_u64
    a = 1_7_u64
    a = 1_8_u64
    a = 1_9_u64
    a = 1___u64
    a = 0_u64

    Assert.equals(9, 9u64)
    Assert.equals(1, 1_u64)
    Assert.equals(10, 1_0u64)
    Assert.equals(1, 1__u64)
    Assert.equals(2, 2_u64)
    Assert.equals(101, 101_u64)
    Assert.equals(10, 1_0_u64)
    Assert.equals(0, 0_u64)
}
