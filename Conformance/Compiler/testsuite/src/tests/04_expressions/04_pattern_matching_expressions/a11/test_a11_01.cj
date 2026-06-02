/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a11_01

  @Level:         1

  @Assertion: 4.4(11)  Note that the remaining patterns are not matched afterwards.
  @Description: Checks that remaining mathching patterns are not matched.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var expr = Assert.getRuntimeZero()
var selector = Assert.getRuntimeZero();

func foo() {
    expr += 10
}

main() {
    match (selector) {
        case 0 => foo()
        case _ => Assert.fail()
    }
    Assert.equals(10, expr);

    match (selector) {
        case 0 where expr != 10 => Assert.fail()
        case 0 where expr == 10 => foo()
        case _ => Assert.fail()
    }
    Assert.equals(20, expr);

    match (selector) {
        case 0 where expr == 20 => foo()
        case 0  => Assert.fail()
        case _ => Assert.fail()
    }
    Assert.equals(30, expr);

    return
}
