/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a02_01

  @Level:         1

  @Assertion: 4.4.1.1(2) The literal in the constant pattern needs to be of the same type as selector.

  @Description: Checks match expressions with constant patterns of the same type.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var v1 = Assert.getRuntimeZero() + 1
var v2 = ""
var v3 = 0.1

main() {
    var m = match (v1) {
        case 1 => 1
        case 2 => 2
        case 4 | 5 => 3
        case _ => 4
    }
    Assert.equals(1, m)

    m = match (v2) {
        case "AAA" => 3
        case "" => 1
        case _ => 2
    }
    Assert.equals(1, m)

    m = match (v3) {
        case 0.2 => 3
        case 0.1 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    return
}
