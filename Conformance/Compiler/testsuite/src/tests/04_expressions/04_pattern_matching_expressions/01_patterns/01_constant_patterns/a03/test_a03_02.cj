/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a03_02

  @Level:         1

  @Assertion: 4.4.1.1(3) A selector matches a constant pattern only if the value of the selector is equal to the value
              of the literal in the pattern.

  @Description: Checks the selector matches not matches if the value of the literal is not equal to the value of the
                selector
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var v1 = Assert.getRuntimeZero() + 1
var v2 = ""
var v3 = 0.3

main() {
    var m = match (v1) {
        case 2 => Assert.fail(); 0
        case 4 | 5 => Assert.fail(); 0
        case 0 => Assert.fail(); 0
        case _ => 1
    }
    Assert.equals(1, m)

    m = match (v2) {
        case "AAA" => Assert.fail(); 0
        case "aaa" => Assert.fail(); 0
        case _ => 1
    }
    Assert.equals(1, m)

    m = match (v3) {
        case 0.2 => Assert.fail(); 0
        case 0.1 => Assert.fail(); 0
        case _ => 1
    }
    Assert.equals(1, m)

    return
}
