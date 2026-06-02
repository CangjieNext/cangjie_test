/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a01_05

  @Level:         1

  @Assertion: 4.4.1.3(1) Like the wildcard pattern, a binding pattern matches any value.

  @Description: Checks that wildcard pattern _ matches string values.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var v1: String = "Cangjie"
    Assert.isTrue(match(v1) {
        case foo => true
    })
    var v2: String = ""
    Assert.isTrue(match(v2) {
        case foo => true
    })
    var v3: String = """

    """
    Assert.isTrue(match(v3) {
        case foo => true
    })
    var v4: String = ##"A"
    "##
    Assert.isTrue(match(v4) {
        case foo => true
    })
    var v5: String = ##""##
    Assert.isTrue(match(v5) {
        case foo => true
    })
    var v6: String = #""#
    Assert.isTrue(match(v6) {
        case foo => true
    })
    return
}
