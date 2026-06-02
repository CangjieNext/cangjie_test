
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_13

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks value and type of the character literals. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var c1 = r'A'
    Assert.equals(r'A', c1)
    Assert.isTrue(c1 is Rune)

    var c2 = r'1'
    Assert.equals(r'1', c2)
    Assert.isTrue(c2 is Rune)

    var c3 = r'n'
    Assert.equals(r'n', c3)
    Assert.isTrue(c3 is Rune)

    var c4 = r'\\'
    Assert.equals(r'\\', c4)
    Assert.isTrue(c4 is Rune)

    var c5 = r'\f'
    Assert.equals(r'\f', c5)
    Assert.isTrue(c5 is Rune)

    var c6 = r'\n'
    Assert.equals(r'\n', c6)
    Assert.isTrue(c6 is Rune)

    var c7 = r'\r'
    Assert.equals(r'\r', c7)
    Assert.isTrue(c7 is Rune)

    var c8 = r'\t'
    Assert.equals(r'\t', c8)
    Assert.isTrue(c8 is Rune)

    var c9 = r'\v'
    Assert.equals(r'\v', c9)
    Assert.isTrue(c9 is Rune)

    var c10 = r'\b'
    Assert.equals(r'\b', c10)
    Assert.isTrue(c10 is Rune)

    var c11 = r'\''
    Assert.equals(r'\'', c11)
    Assert.isTrue(c11 is Rune)

    var c12 = r'\"'
    Assert.equals(r'\"', c12)
    Assert.isTrue(c12 is Rune)

    var c13 = r'\$'
    Assert.equals(r'\$', c13)
    Assert.isTrue(c13 is Rune)

    var c14 = r'\u{A}'
    Assert.equals(r'\u{A}', c14)
    Assert.isTrue(c14 is Rune) 
}
