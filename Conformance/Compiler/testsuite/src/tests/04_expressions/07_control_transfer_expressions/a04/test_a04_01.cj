
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a04_01

  @Level:         1

  @Assertion:   4.7(4) Control transfer expressions can become part of a more complex expression, but unreachable codes
                may be generated (reporting a warning at the unreachable code):
  @Description: Checks that a warning is reported due to an unreachable statement being present after break.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var i = 0
    for (_ in 0..10) {
        break
        i++
    }
    Assert.equals(0, i)
}
