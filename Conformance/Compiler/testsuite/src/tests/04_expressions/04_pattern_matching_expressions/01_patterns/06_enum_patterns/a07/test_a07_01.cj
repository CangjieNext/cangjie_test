/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a07_01

  @Level:         1

  @Assertion: 4.4.1.6(7) Note that matching enum requires that the type of the enum pattern is the same as the type of
              the selector, and that the compiler checks to see if each constructor of the enum type (including the
              value of the constructor’s argument) is fully covered, otherwise the compiler will report an error.

  @Description: Checks matching of the enum patern with same type as the selector.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E1 {
    | A
    | B
}

enum E2 {
    | C
    | D
}

main() {
    var v1: E1 = A
    Assert.isTrue(match(v1) {
        case A => true
        case B => false
    })
    var v2: E2 = C
    Assert.isTrue(match(v2) {
        case C => true
        case D => false
    })
    return
}
