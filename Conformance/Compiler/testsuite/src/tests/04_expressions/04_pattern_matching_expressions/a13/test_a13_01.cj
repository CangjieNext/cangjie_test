/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a13_01

  @Level:         1

  @Assertion: 4.4(13)  For safety, it is required that the patterns (together with the pattern guards) in a cases
              should be exhaustive forselector, i.e., there is a match for every value of selector.

  @Description: Checks matching of the matching expression with exhaustive patterns with the pattern guards.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E {A | B}

var expr1 = A
var expr2 = 0

main() {

    var m = match (expr1) {
        case A where expr2 != 0 => 0
        case A where expr2 == 0 => 1
        case A => 2
        case B => 3
    }
    Assert.equals(1, m)

    return
}
