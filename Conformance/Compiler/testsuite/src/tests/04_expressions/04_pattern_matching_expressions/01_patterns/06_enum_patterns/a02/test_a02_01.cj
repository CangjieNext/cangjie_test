/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a02_01

  @Level:         1

  @Assertion: 4.4.1.6(2) enum pattern is used to match an enum constructor in the format constructorName
              (without parameters) or constructorName(pattern_1,pattern_2,... , pattern_k) (with parameters),
              with a number of comma- separated patterns (which can be any other type of pattern, and nesting is
              allowed) within parentheses to match each parameter in turn.

  @Description: Checks that the enum pattern matching an enum constructor in the format constructorName
                (without parameters)
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E {
    A | B
}

main() {
    var v1: E = A
    Assert.isTrue(match(v1) {
        case A => true
        case B => false
    })

    var v2: E = B
    Assert.isTrue(match(v2) {
        case A => false
        case B => true
    })

    return
}
