/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a15_01

  @Level:         1

  @Assertion: 4.4(15)  An easy way of ensuring exhaustiveness is to use the wildcard pattern (i.e.,_) as the last case
              pattern so that it always covers the remaining patterns.
  @Description: Checks that using the wildcard pattern (i.e.,_) unsures exhaustiveness.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var expr = Assert.getRuntimeZero()
var expr2 = Assert.getRuntimeZero() + 1

main() {

    var m = match (expr) {
        case _ => 1
    }
    Assert.equals(1, m)

    m = match (expr) {
        case 0 where expr2 == 1 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    m = match (expr) {
        case 0 => 1
        case _ => 2
    }
    Assert.equals(1, m)

    m = match {
        case _ => 1
    }
    Assert.equals(1, m)

    m = match {
        case expr != 0 => 1
        case _ => 2
    }
    Assert.equals(2, m)

    return
}
