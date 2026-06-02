/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a01_04

  @Level:         1

  @Assertion: 4.4.1.1(1) Constant patterns can be integer literals, character byte literals, floating point literals,
              character literals, boolean literals, string literals (string interpolation is not supported),
              Unit literals.

  @Description: Checks match expressions with character literals constant patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let l1 = 'a'
    var m = match (l1) {
        case 'a' => 1
        case 'b' => 2
        case _ => 3
    }
    Assert.equals(1, m)

    let l2 = 'a'
    m = match (l2) {
        case 'A' => 1
        case 'a' => 2
        case _ => 3
    }
    Assert.equals(2, m)

    let l3 = 'a'
    m = match (l3) {
        case 'A' | 'a' => 1
        case 'b' => 2
        case _ => 3
    }
    Assert.equals(1, m)

    let l4 = '\u{41}'
    m = match (l4) {
        case 'A' => 1
        case _ => 2
    }
    Assert.equals(1, m)

    m = match (l4) {
        case '\u{41}' => 1
        case _ => 2
    }
    Assert.equals(1, m)

    return
}
