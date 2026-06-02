/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a03_02

  @Level:         1

  @Assertion: 4.4.1.4(3) For example, (x, y, z) is a tuple pattern consisting of three binding patterns,
              and (1, 0, 0) is a tuple pattern consisting of three constant patterns.

  @Description: Checks matching of the second example tuple pattern from spec: (1, 0, 0)
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var v = (1, 0, 0)
    Assert.isTrue(match (v) {
        case (1, 0, 0) => true
        case _ => false
    })
    return
}
