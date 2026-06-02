/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a09_01

  @Level:         1

  @Assertion: 4.4(9) When the match expression is evaluated, the patterns are matched one-by-one in the order defined
              by the cases.
  @Description: Checks the pattern matching order.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var expr = Assert.getRuntimeZero()

main() {
    var m = match (expr) {
        case _ => "0"
        case 0 => "1"
    }
    Assert.equals("0", m);

    m = match (expr) {
        case 0 => "1"
        case 0 => "0"
        case _ => "fail"
    }
    Assert.equals("1", m);

    return
}
