/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a02_02

  @Level:         1

  @Assertion: 4.4.1.6(2) enum pattern is used to match an enum constructor in the format constructorName
              (without parameters) or constructorName(pattern_1,pattern_2,... , pattern_k) (with parameters),
              with a number of comma- separated patterns (which can be any other type of pattern, and nesting is
              allowed) within parentheses to match each parameter in turn.

  @Description: Checks that the enum pattern matching an enum constructor in the format
                constructorName(pattern_1,pattern_2,... , pattern_k).
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E {
    | A(Int64)
    | B(Int32, Float32)
    | C(Rune, Float64, Int16)
    | D(String, UInt8, UInt32, Byte)
}

main() {
    Assert.isTrue(match(A(1)) {
        case A(1) => true
        case _ => false
    })

    Assert.isTrue(match(A(1)) {
        case A(x) => Assert.equals(1, x); true
        case _ => false
    })

    Assert.isTrue(match(B(1i32, 0.5_f32)) {
        case B(1, f) => true
        case _ => false
    })

    Assert.isTrue(match(C(r'a', 0.3, 5i16)) {
        case C(r'b', 0.3, z) => false
        case C(x, y, z) => true
        case _ => false
    })

    Assert.isTrue(match(D("aaa", 2u8, 3u32, b'a')) {
        case C(r'b', 0.3, z) => false
        case C(x, y, z) => false
        case B(x, y) => false
        case D("aaa", 2u8, 3u32, b'a') => true
        case _ => false
    })

    return
}
