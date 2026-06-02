
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_01_a02_03

  @Level:         1

  @Assertion: 4.1(2) For collective literals and tuple literals (see Value
              Types), whose value is the value of the literal obtained by 
              evaluating all expressions within it, and whose type is 
              determined by its syntax.
  @Description: Checks value and type of the tuples. Tests character, byte 
                character, byte character array and String literals.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var c = (r'A', r'1', r'n', 
            r'\\', r'\f', r'\n', r'\r', r'\t', r'\v', r'\b', r'\'', r'\"', r'\$', 
            r'\u{A}',  r'\u{A}',
            0)
    Assert.isTrue(c is (Rune, Rune, Rune, Rune, 
            Rune, Rune, Rune, Rune, 
            Rune, Rune, Rune, Rune,
            Rune, Rune, Rune, Int64)) 
    if((r'A', r'1', r'n', 
            r'\\', r'\f', r'\n', r'\r', r'\t', r'\v', r'\b', r'\'', r'\"',  r'\$',
            r'\u{A}', r'\u{A}', 
            Assert.getRuntimeZero()) != c) {
        Assert.fail(reason: "Should be equal.")
    }

    var b = (b'A', b'1', b'n', 
            b'\\', b'\f', b'\n', b'\r', b'\t', b'\v', b'\b', b'\'', b'\"', 
            b'\u{A}',  b'\u{A}', 
            0)
    Assert.isTrue(b is (UInt8, UInt8, UInt8, UInt8, 
            UInt8, UInt8, UInt8, UInt8, 
            UInt8, UInt8, UInt8, UInt8,
            UInt8, UInt8, Int64)) 
    if((b'A', b'1', b'n', 
            b'\\', b'\f', b'\n', b'\r', b'\t', b'\v', b'\b', b'\'', b'\"',  
            b'\u{A}', b'\u{A}', 
            Assert.getRuntimeZero()) != b) {
        Assert.fail(reason: "Should be equal.")
    }

    var a = ("Hello World", 
            0)
    Assert.isTrue(a is (String, 
            Int64))
    if(("Hello World", 
            Assert.getRuntimeZero())!= a) {
        Assert.fail(reason: "Should be equal.")
    }
}
