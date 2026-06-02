/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_07_a02_3_neg

  @Level:         1

  @Assertion:    1.3.7(2)
                 fragment CharInByteStringArray
                 // ASCII 0x00~0x7F without \n \r \" \\
                       : [\u0000-\u0009\u000B\u000C\u000E-\u0021\u0023-\u005B\u005D-\u007F];
                ByteStringArrayLiteral
                : 'b' '"' (CharInByteStringArray | ByteEscapeSeq)* '"';

  @Description:  Emit error for incorrect escape sequence

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/

main() {
    let Esc: Array<UInt8> =  b"\t\0\r\n\'\"\\\f\x\b"
    return 0
}

