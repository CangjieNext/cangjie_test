/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_02_a01_03

  @Level:         1

  @Assertion: 4.4.1.2(1) A wildcard pattern is written as _, which matches any value.

  @Description: Checks that wildcard pattern _ matches character values.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var v1: Rune = 'a'
    Assert.isTrue(match(v1) {
        case _ => true
    })
    var v2: Rune = 'A'
    Assert.isTrue(match(v2) {
        case _ => true
    })
    var v3: Rune = '\u{41}'
    Assert.isTrue(match(v2) {
        case _ => true
    })
    return
}
