/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a10_01

  @Level:         1

  @Assertion: 4.4(10) Whenever the selector successfully matches a pattern (and its the pattern guard is satisfied),
              the code after => is executed.
  @Description: Checks that the code is executed when the selected matched successfully.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var expr = Assert.getRuntimeZero()
var expr2 = Assert.getRuntimeZero() + 1

func foo() {
    expr++
}

main() {
    match (expr) {
        case 1 => Assert.fail()
        case _ => foo()
    }
    Assert.equals(1, expr);

    match (expr) {
        case 1 where expr2 > 0 => foo()
        case _ => Assert.fail()
    }
    Assert.equals(2, expr);

    match (expr) {
        case 1 where expr2 == 0 => Assert.fail()
        case _ => foo()
    }
    Assert.equals(3, expr);

    return
}
