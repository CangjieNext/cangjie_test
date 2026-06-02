/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a05_01

  @Level:         1

  @Assertion: 4.4.1.6(5) If the identifier in a pattern is an enum constructor in the scope where the pattern matches,
              the identifier will always be matched as an enum pattern, otherwise it will be matched as a binding
              pattern.

  @Description: Checks matching of the enum constructor in enum pattern.

  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E {
    | A
}

main() {
    var v: E = A
    Assert.isTrue(match(v) {
        case A => true
    })

    return
}
