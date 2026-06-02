/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_02_a01_01

  @Level:         1

  @Assertion: 4.4.1.2(1) A wildcard pattern is written as _, which matches any value.

  @Description: Checks that wildcard pattern _ matches integer values.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var v1: UInt8 = 1
    Assert.isTrue(match(v1) {
        case _ => true
    })
    var v2: UInt16 = 1
    Assert.isTrue(match(v2) {
        case _ => true
    })
    var v3: UInt32 = 1
    Assert.isTrue(match(v3) {
        case _ => true
    })
    var v4: UInt64 = 1
    Assert.isTrue(match(v4) {
        case _ => true
    })
    var v5: Int8 = 1
    Assert.isTrue(match(v5) {
        case _ => true
    })
    var v6: Int16 = 1
    Assert.isTrue(match(v6) {
        case _ => true
    })
    var v7: Int32 = 1
    Assert.isTrue(match(v7) {
        case _ => true
    })
    var v8: Int64 = 1
    Assert.isTrue(match(v8) {
        case _ => true
    })
    return
}
