/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a05_01

  @Level:         1

  @Assertion:    2.3.1(5) The conversion of an integer type to Rune is done by means of Rune(num), where num can be of
                 any integer type, and only if the value of num falls in [0x0000, 0xD7FF] or [0xE000, 0x10FFFF] 
                 (i.e., the Unicode scalar value), the character represented by the corresponding Unicode scalar value
                 is returned; otherwise, a compile error (the value of num can be determined at compile time) is
                 generated or a runtime exception is thrown.

  @Description:  Check that the result of conversion from integer types to Rune is the character value corresponding
                 to the Unicode scalar value

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert


main(): Unit {
    
    let r1 = Rune(9924_i16)
    var r2 = Rune(128156_i32)
    let r3 = Rune(8721_i64)
    var r4 = Rune(64_i8)

    Assert.isTrue(r1 is Rune)
    Assert.isTrue(r2 is Rune)
    Assert.isTrue(r3 is Rune)
    Assert.isTrue(r4 is Rune)

    Assert.equals(r'⛄', r1)
    Assert.equals(r'💜', r2)
    Assert.equals(r'∑', r3)
    Assert.equals(r'@', r4)
}
