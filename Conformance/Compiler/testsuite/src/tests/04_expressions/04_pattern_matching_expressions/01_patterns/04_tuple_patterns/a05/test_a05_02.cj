/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a05_02

  @Level:         1

  @Assertion: 4.4.1.4(5) Moreover, if the pattern in the tuple pattern is a constant pattern or an enum pattern, it
              needs to has the same type as the corresponding element of the selector.

  @Description: Checks matching of the tuple pattern with the enum pattern in it.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E { A | B }

main() {
    Assert.isTrue(match ((A, B)) {
        case (A, B) => true
        case _ => false
    })
    return
}
