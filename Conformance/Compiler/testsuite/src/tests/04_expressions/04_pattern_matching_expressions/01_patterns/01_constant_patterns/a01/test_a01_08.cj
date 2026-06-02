/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a01_08

  @Level:         1

  @Assertion: 4.4.1.1(1) Constant patterns can be integer literals, character byte literals, floating point literals,
              character literals, boolean literals, string literals (string interpolation is not supported),
              Unit literals.

  @Description: Checks match expressions with Unit literals constant patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func foo() {}

main() {
    let l1: Unit = foo()
    var m = match (l1) {
        case () => 1
    }
    Assert.equals(1, m)

    return
}
