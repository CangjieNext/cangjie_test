/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a06_01

  @Level:         1

  @Assertion: 4.4.1.1(6) Note that floating point literal matching in constant mode follows the same rules as floating
              point equivalence, and will have the same precision problems as equivalence.

  @Description: Check matching negative 0 (-0.0)
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var f: Float16 = -0.0
    match(f) {
        case 0.0 => Assert.equals(0.0, f);
        case _ => Assert.fail()
    }
    return
}
