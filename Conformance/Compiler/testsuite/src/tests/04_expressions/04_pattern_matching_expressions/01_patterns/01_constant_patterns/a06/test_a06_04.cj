/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a06_04

  @Level:         1

  @Assertion: 4.4.1.1(6) Note that floating point literal matching in constant mode follows the same rules as floating
              point equivalence, and will have the same precision problems as equivalence.

  @Description: Check matching with equivalence precision problem.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var f: Float64 = (0.3 * 3.0) + 0.1
    match(f) {
        case 1.0 => Assert.fail()
        case _ => Assert.notEquals(1.0, f)
    }
    return
}
