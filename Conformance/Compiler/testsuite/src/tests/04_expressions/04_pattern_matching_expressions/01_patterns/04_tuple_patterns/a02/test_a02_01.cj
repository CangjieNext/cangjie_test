/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a02_01

  @Level:         1

  @Assertion: 4.4.1.4(2) A tuple pattern is written in the form of multiple patterns enclosed in a pair of parentheses,
              i.e., (pattern_1, pattern_2, ... pattern_k).

  @Description: Checks matching of multiple patterns enclosed in a pair of parentheses.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var z = Assert.getRuntimeZero()

main() {
    var v1 = (1, 2)
    Assert.isTrue(match(v1) {
        case (1, 2) => true
        case (_, _) => false
    })
    var v2 = (1, 2, 3)
    Assert.isTrue(match(v2) {
        case (1, 2, 3) => true
        case (_, _, _) => false
    })
    var v3 = (1, 2, 3, 4)
    Assert.isTrue(match(v3) {
        case (1, 2, 3, 4) => true
        case (_, _, _, _) => false
    })
    var v4 = (1, 2, 3, 4, 5)
    Assert.isTrue(match(v4) {
        case (1, 2, 3, 4, 5) => true
        case (_, _, _, _, _) => false
    })
    var v5 = (1, 2, 3, 4, 5, 6)
    Assert.isTrue(match(v5) {
        case (1, 2, 3, 4, 5, 6) => true
        case (_, _, _, _, _, _) => false
    })
    return
}
