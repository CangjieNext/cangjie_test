/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a01_02

  @Level:         1

  @Assertion: 4.4.1.1(1) Constant patterns can be integer literals, character byte literals, floating point literals,
              character literals, boolean literals, string literals (string interpolation is not supported),
              Unit literals.

  @Description: Checks match expressions with character byte literals constant patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let l1: UInt8 = b'\u{A}'
    var m = match (l1) {
        case b'\u{A}' => 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l2: UInt8 = b'\t'
    m = match (l2) {
        case b'\t'=> 1
        case _ => 2
    }
    Assert.equals(1, m)

    let l3: UInt8 = b'\u{AB}'
    m = match (l3) {
        case b'\u{AB}' => 1
        case _ => 2
    }
    Assert.equals(1, m)

    return
}
