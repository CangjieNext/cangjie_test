/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a16_01

  @Level:         1

  @Assertion: 4.4(16)  Note that the patterns are not necessarily mutually exclusive.
  @Description: Checks that matching of not mutually exclusive patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E {A | B | C}

var zero = Assert.getRuntimeZero()
var one = Assert.getRuntimeZero() + 1
var two = Assert.getRuntimeZero() + 2
var expr3 = A

main() {

    var m = match (zero) {
        case 0 | 1 => 1
        case 1 | 2 => 2
        case _ => 3
    }
    Assert.equals(1, m)

    m = match (one) {
        case 0 | 1 => 1
        case 1 | 2 => 2
        case _ => 3
    }
    Assert.equals(1, m)

    m = match (zero) {
        case 0 | 1 where two != 2 => 1
        case 0 | 1 where two == 1 => 1
        case 0 | 1 | 2 => 2
        case _ => 3
    }
    Assert.equals(2, m)

    m = match (one) {
        case 0 | 1 where two != 2 => 1
        case 0 | 1 where two == 1 => 1
        case 1 | 2 => 2
        case _ => 3
    }
    Assert.equals(2, m)

    m = match (expr3) {
        case A | B | C where two != 2 => 1
        case A => 1
        case B => 2
        case _ => 3
    }
    Assert.equals(1, m)

    return
}
