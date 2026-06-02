/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a01_05

  @Level:         1

  @Assertion: 4.4.1.1(1) Constant patterns can be integer literals, character byte literals, floating point literals,
              character literals, boolean literals, string literals (string interpolation is not supported),
              Unit literals.

  @Description: Checks match expressions with boolean literals constant patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let l1: Bool = true
    var m = match (l1) {
        case true => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l2: Bool = false
    m = match (l2) {
        case false => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l3: Bool = true
    m = match (l3) {
        case true | false => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l4: Bool = true
    m = match (l4) {
        case false | false => 0
        case true | true => 1
        case _ => 2
    }
    Assert.equals(1, m)

    return
}
