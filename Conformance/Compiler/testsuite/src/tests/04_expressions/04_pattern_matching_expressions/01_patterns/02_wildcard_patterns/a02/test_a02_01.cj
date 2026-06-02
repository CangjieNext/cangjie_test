/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_02_a02_01

  @Level:         1

  @Assertion: 4.4.1.2(2) It is typically used as the last pattern in a match expression to match “all other” cases.

  @Description: Checks using wildcard pattern _ as last pattern to match cases not covered by other patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var l1: Int64 = 1
    var m = match (l1) {
        case 0 => false
        case 10 | 20 => false
        case 1 where l1 is Int32 => false
        case _ => true
    }
    Assert.isTrue(m)

    var l2 = "aaa"
    m = match (l2) {
        case "one" => false
        case "two" => false
        case "" | "fff" => false
        case _ => true
    }
    Assert.isTrue(m)

    var l3 = 0.3
    m = match (l3) {
        case 0.1 => false
        case 0.2 => false
        case _ => true
    }
    Assert.isTrue(m)

    var l4 = false
    m = match (l4) {
        case true => false
        case _ => true

    }
    Assert.isTrue(m)

    var l5 = 'c'
    m = match (l5) {
        case 'a' => false
        case 'b' => false
        case _ => true
    }
    Assert.isTrue(m)

    var l6 = b'c'
    m = match (l6) {
        case b'a' => false
        case 0 => false
        case _ => true
    }
    Assert.isTrue(m)

    var l7: Unit = ()
    m = match (l7) {
        case foo:Int32 => false
        case _ => true
    }
    Assert.isTrue(m)

    var l8 = (1, 2)
    m = match (l8) {
        case (2, 3) => false
        case _ => true
    }
    Assert.isTrue(m)

    return
}
