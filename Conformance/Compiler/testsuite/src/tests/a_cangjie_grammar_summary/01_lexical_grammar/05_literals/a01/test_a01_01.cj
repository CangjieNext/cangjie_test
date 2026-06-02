/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_01_05_a01_01

  @Level:         1
  @Assertion:   A.1.5(1) 
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
                    : (DecimalDigitWithOutZero (DecimalDigit | '_')*) | DecimalDigit
                    ;
                fragment DecimalFragment
                    : DecimalDigit (DecimalDigit | '_')*
                    ;
                fragment DecimalDigit
                    : [0-9]
                    ;
                fragment DecimalDigitWithOutZero
                    : [1-9]
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

  @Description: Check various symbols as CharacterByteLiteral
  @Comment:     Auto-generated tests by gen_literals_tests_a01.py with seed = 1
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
import utils.assert.Assert

main() {
  
  // Check 5_5i8 symbol is Int8 type
  Assert.isTrue(5_5i8 is Int8)

  // Check -0b110_111_i8 symbol is Int8 type
  Assert.isTrue(-0b110_111_i8 is Int8)

  // Check 0o37i8 symbol is Int8 type
  Assert.isTrue(0o37i8 is Int8)

  // Check 0b11111_i8 symbol is Int8 type
  Assert.isTrue(0b11111_i8 is Int8)

  // Check 0x1Fi8 symbol is Int8 type
  Assert.isTrue(0x1Fi8 is Int8)

  // Check -128i8 symbol is Int8 type
  Assert.isTrue(-128i8 is Int8)

  // Check 127i8 symbol is Int8 type
  Assert.isTrue(127i8 is Int8)

  // Check 0i8 symbol is Int8 type
  Assert.isTrue(0i8 is Int8)

  // Check -0i8 symbol is Int8 type
  Assert.isTrue(-0i8 is Int8)

  // Check 6116i16 symbol is Int16 type
  Assert.isTrue(6116i16 is Int16)

  // Check 0b1_0111_1110_0100_i16 symbol is Int16 type
  Assert.isTrue(0b1_0111_1110_0100_i16 is Int16)

  // Check -0o13744i16 symbol is Int16 type
  Assert.isTrue(-0o13744i16 is Int16)

  // Check 0x17E4i16 symbol is Int16 type
  Assert.isTrue(0x17E4i16 is Int16)

  // Check -32768_i16 symbol is Int16 type
  Assert.isTrue(-32768_i16 is Int16)

  // Check 32767i16 symbol is Int16 type
  Assert.isTrue(32767i16 is Int16)

  // Check 0i16 symbol is Int16 type
  Assert.isTrue(0i16 is Int16)

  // Check -0i16 symbol is Int16 type
  Assert.isTrue(-0i16 is Int16)

  // Check 987661162i32 symbol is Int32 type
  Assert.isTrue(987661162i32 is Int32)

  // Check -0b101111000110____000110100100100_i32 symbol is Int32 type
  Assert.isTrue(-0b101111000110____000110100100100_i32 is Int32)

  // Check 0o13744_5_6756_i32 symbol is Int32 type
  Assert.isTrue(0o13744_5_6756_i32 is Int32)

  // Check -0xBF25DEE_i32 symbol is Int32 type
  Assert.isTrue(-0xBF25DEE_i32 is Int32)

  // Check 0xbf25dee_i32 symbol is Int32 type
  Assert.isTrue(0xbf25dee_i32 is Int32)

  // Check -214_7483648i32 symbol is Int32 type
  Assert.isTrue(-214_7483648i32 is Int32)

  // Check 2147483647_i32 symbol is Int32 type
  Assert.isTrue(2147483647_i32 is Int32)

  // Check 0i32 symbol is Int32 type
  Assert.isTrue(0i32 is Int32)

  // Check -0i32 symbol is Int32 type
  Assert.isTrue(-0i32 is Int32)

  // Check 70453305375603164i64 symbol is Int64 type
  Assert.isTrue(70453305375603164i64 is Int64)

  // Check 0b1111101001_001100111010000111_0000001010100011100111011100_i64 symbol is Int64 type
  Assert.isTrue(0b1111101001_001100111010000111_0000001010100011100111011100_i64 is Int64)

  // Check 0O3722316416012434734i64 symbol is Int64 type
  Assert.isTrue(0O3722316416012434734i64 is Int64)

  // Check 0xFA4CE8702A39DCi64 symbol is Int64 type
  Assert.isTrue(0xFA4CE8702A39DCi64 is Int64)

  // Check 70453305375603164 symbol is Int64 type
  Assert.isTrue(70453305375603164 is Int64)

  // Check 0b11111010010011001110100001110000001010100011100111011100 symbol is Int64 type
  Assert.isTrue(0b11111010010011001110100001110000001010100011100111011100 is Int64)

  // Check 0O372231641_6012434734 symbol is Int64 type
  Assert.isTrue(0O372231641_6012434734 is Int64)

  // Check 0xFA4CE8702A39DC symbol is Int64 type
  Assert.isTrue(0xFA4CE8702A39DC is Int64)

  // Check -9223372036854775808 symbol is Int64 type
  Assert.isTrue(-9223372036854775808 is Int64)

  // Check 9223372036854775807 symbol is Int64 type
  Assert.isTrue(9223372036854775807 is Int64)

  // Check 0 symbol is Int64 type
  Assert.isTrue(0 is Int64)

  // Check -0 symbol is Int64 type
  Assert.isTrue(-0 is Int64)

  // Check 255u8 symbol is UInt8 type
  Assert.isTrue(255u8 is UInt8)

  // Check 0b11111111_u8 symbol is UInt8 type
  Assert.isTrue(0b11111111_u8 is UInt8)

  // Check 0o377u8 symbol is UInt8 type
  Assert.isTrue(0o377u8 is UInt8)

  // Check 0xFFu8 symbol is UInt8 type
  Assert.isTrue(0xFFu8 is UInt8)

  // Check 0u8 symbol is UInt8 type
  Assert.isTrue(0u8 is UInt8)

  // Check 6116u16 symbol is UInt16 type
  Assert.isTrue(6116u16 is UInt16)

  // Check 0b1011111100100_u16 symbol is UInt16 type
  Assert.isTrue(0b1011111100100_u16 is UInt16)

  // Check 0o13744u16 symbol is UInt16 type
  Assert.isTrue(0o13744u16 is UInt16)

  // Check 0x17E4u16 symbol is UInt16 type
  Assert.isTrue(0x17E4u16 is UInt16)

  // Check 65_535u16 symbol is UInt16 type
  Assert.isTrue(65_535u16 is UInt16)

  // Check 0_u16 symbol is UInt16 type
  Assert.isTrue(0_u16 is UInt16)

  // Check 98766116u32 symbol is UInt32 type
  Assert.isTrue(98766116u32 is UInt32)

  // Check 0b101111000110000110100100100_u32 symbol is UInt32 type
  Assert.isTrue(0b101111000110000110100100100_u32 is UInt32)

  // Check 0o1374456756_u32 symbol is UInt32 type
  Assert.isTrue(0o1374456756_u32 is UInt32)

  // Check 0xBF25DEE_u32 symbol is UInt32 type
  Assert.isTrue(0xBF25DEE_u32 is UInt32)

  // Check 0xbf25dee_u32 symbol is UInt32 type
  Assert.isTrue(0xbf25dee_u32 is UInt32)

  // Check 4_294_967_295u32 symbol is UInt32 type
  Assert.isTrue(4_294_967_295u32 is UInt32)

  // Check 0u32 symbol is UInt32 type
  Assert.isTrue(0u32 is UInt32)

  // Check 704533053_75603164u64 symbol is UInt64 type
  Assert.isTrue(704533053_75603164u64 is UInt64)

  // Check 0b1111_1010010011001110100001110000001010100011100111011100_u64 symbol is UInt64 type
  Assert.isTrue(0b1111_1010010011001110100001110000001010100011100111011100_u64 is UInt64)

  // Check 0O3722316416012434734u64 symbol is UInt64 type
  Assert.isTrue(0O3722316416012434734u64 is UInt64)

  // Check 0xFA4CE8702A39DCu64 symbol is UInt64 type
  Assert.isTrue(0xFA4CE8702A39DCu64 is UInt64)

  // Check 18446744073709551615_u64 symbol is UInt64 type
  Assert.isTrue(18446744073709551615_u64 is UInt64)

  // Check 0u64 symbol is UInt64 type
  Assert.isTrue(0u64 is UInt64)

  return 0
}
