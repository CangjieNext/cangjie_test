
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_14

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks value and type of the character byte literals. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var c1 = b'A'
    Assert.equals(b'A', c1)
    Assert.isTrue(c1 is UInt8)

    var c2 = b'1'
    Assert.equals(b'1', c2)
    Assert.isTrue(c2 is UInt8)

    var c3 = b'n'
    Assert.equals(b'n', c3)
    Assert.isTrue(c3 is UInt8)

    var c4 = b'\\'
    Assert.equals(b'\\', c4)
    Assert.isTrue(c4 is UInt8)

    var c5 = b'\f'
    Assert.equals(b'\f', c5)
    Assert.isTrue(c5 is UInt8)

    var c6 = b'\n'
    Assert.equals(b'\n', c6)
    Assert.isTrue(c6 is UInt8)

    var c7 = b'\r'
    Assert.equals(b'\r', c7)
    Assert.isTrue(c7 is UInt8)

    var c8 = b'\t'
    Assert.equals(b'\t', c8)
    Assert.isTrue(c8 is UInt8)

    var c9 = b'\v'
    Assert.equals(b'\v', c9)
    Assert.isTrue(c9 is UInt8)

    var c10 = b'\b'
    Assert.equals(b'\b', c10)
    Assert.isTrue(c10 is UInt8)

    var c11 = b'\''
    Assert.equals(b'\'', c11)
    Assert.isTrue(c11 is UInt8)

    var c12 = b'\"'
    Assert.equals(b'\"', c12)
    Assert.isTrue(c12 is UInt8)

    var c13 = b'\u{5}'
    Assert.equals(b'\u{5}', c13)
    Assert.isTrue(c13 is UInt8)

    var c14 = b'\u{A}'
    Assert.equals(b'\u{A}', c14)
    Assert.isTrue(c14 is UInt8) 
}
