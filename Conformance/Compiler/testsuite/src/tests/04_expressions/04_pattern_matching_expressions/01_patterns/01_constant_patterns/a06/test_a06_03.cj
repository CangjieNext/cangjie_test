/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a06_03

  @Level:         1

  @Assertion: 4.4.1.1(6) Note that floating point literal matching in constant mode follows the same rules as floating
              point equivalence, and will have the same precision problems as equivalence.

  @Description: Check matching Not a Number (NaN)
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 0006075

*/

import utils.assert.Assert
main() {
    var f: Float16 = Float16.NaN
    match(f) {
        case 0.0 => Assert.fail()
        case _ =>  Assert.notEquals(0.0, f)
    }
    return
}
