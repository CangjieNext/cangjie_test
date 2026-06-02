/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a01_07

  @Level:         1

  @Assertion: 4.4.1.3(1) Like the wildcard pattern, a binding pattern matches any value.

  @Description: Checks that wildcard pattern _ matches Unit values.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var v1: Unit = println("")
    Assert.isTrue(match(v1) {
        case foo => true
    })
    var v2: Unit = ()
    Assert.isTrue(match(v2) {
        case foo => true
    })
    return
}
