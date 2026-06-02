/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a04_01

  @Level:         1

  @Assertion: 4.4.1.4(4) The number of patterns in the tuple pattern needs to be of the same as the dimension of
              the selector.

  @Description: Checks matching of tuple patterns with the same dimension as the selector.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var v1 = (1, 2)
    Assert.isTrue(match (v1) {
        case (1, 2) => true
        case _ => false
    })
    Assert.isTrue(match (v1) {
        case (x, y) => true
    })

    var v2 = (1, 2, 3)
    Assert.isTrue(match (v2) {
        case (1, 2, 3) => true
        case _ => false
    })
    Assert.isTrue(match (v2) {
        case (x, y, z) => true
    })

    var v3 = (1, 2, 3, 4)
    Assert.isTrue(match (v3) {
        case (1, 2, 3, 4) => true
        case _ => false
    })
    Assert.isTrue(match (v3) {
        case (x, y, z, w) => true
    })
    return
}
