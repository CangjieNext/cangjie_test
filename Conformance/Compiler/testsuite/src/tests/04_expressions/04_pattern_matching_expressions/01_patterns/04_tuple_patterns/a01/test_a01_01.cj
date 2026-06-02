/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a01_01

  @Level:         1

  @Assertion: 4.4.1.4(1) Tuple patterns are used to match tuples.

  @Description: Checks that the tuple pattern matches some of the tuple examples.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E { A | B }

main() {
    var v1: (Int64, Float32) = (123, 0.123)
    Assert.isTrue(match(v1) {
        case (a, b) => true
    })
    var v2: (Int64, Float64) = (123, 0.123)
    Assert.isTrue(match(v2) {
        case (123, 0.123) => true
        case _ => false
    })
    var v3: (Int32, Float32, Rune) = (123, 0.123, r'a')
    Assert.isTrue(match(v3) {
        case (a, b, c) => true
    })
    var v4: (Int16, Float32, Rune) = (123, 0.123, r'a')
    Assert.isTrue(match(v4) {
        case (123, 0.123, 'a') => true
        case _ => false
    })
    var v5: (Int8, Float32, Rune) = (123, 0.123, r'a')
    Assert.isTrue(match(v5) {
        case (123, a, b) => true
        case (a, 0.123, c) => false
        case _ => false
    })
    var v6: (E, E) = (A, B)
    Assert.isTrue(match(v6) {
        case (A, b) => true
        case (a, B) => false
        case _ => false
    })
    return
}
