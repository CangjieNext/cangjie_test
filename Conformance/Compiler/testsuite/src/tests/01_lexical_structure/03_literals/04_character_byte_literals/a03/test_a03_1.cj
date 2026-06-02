/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_04_a03_1

  @Level:         1

  @Assertion:      1.3.4(3) The syntax is:
                   CharacterByteLiteral
                     : 'b' '\'' (SingleCharByte | ByteEscapeSeq) '\''
                     ;
                   ByteEscapeSeq
                     : HexCharByte
                     | ByteEscapedIdentifier
                     ;
                   fragment SingleCharByte
                     : [\u0000-\u0009\u000B\u000C\u000E-\u0021\u0023-\u0026\u0028-\u005B\u005D-\u007F] ;
                   fragment ByteEscapedIdentifier
                     : '\\' ('t' | 'b' | 'r' | 'n' | '\'' | '"' | '\\' | 'f' | 'v' | '0')
                     ;
                   fragment HexCharByte
                     : '\\' 'u' '{' HexadecimalDigit '}'
                     | '\\' 'u' '{' HexadecimalDigit HexadecimalDigit '}'
                     ;

  @Description:  Check correct syntax variations for CharacterByteLiteral

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/
import utils.assert.Assert

main() {
    Assert.isTrue(b'A'==b'A')     // SingleCharByte
    Assert.isTrue(b'A' <b'a') 
    Assert.isTrue(b'A'<=b'A')
    Assert.isTrue(b'A'>=b'A')
    Assert.isTrue(b'0'==b'0')

    Assert.isTrue(b'\\'!= b'0')   // ByteEscapeSeq
    Assert.isTrue(b'\f'!= b'0')
    Assert.isTrue(b'\n'!= b'0')
    Assert.isTrue(b'\r'!= b'0')
    Assert.isTrue(b'\t'!= b'0')
    Assert.isTrue(b'\v'!= b'0')
    Assert.isTrue(b'\''!= b'0')
    Assert.isTrue(b'\"'!= b'0')
    Assert.isTrue(b'\u{A}' is UInt8)
    Assert.isTrue(b'\u{AB}' is UInt8)

    return 0
}

