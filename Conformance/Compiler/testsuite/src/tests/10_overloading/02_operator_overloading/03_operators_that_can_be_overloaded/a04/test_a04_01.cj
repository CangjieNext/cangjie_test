
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        10_02_03_a04_01

  @Level:         1

  @Assertion:   10.2.3(4) Operator  Description
                          !-        NOT: unary Negative: unary
  @Description: Checks that precedences of ! and unary - match their positions in the table.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: ../aux_decl.cj
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let c = C("")

    Assert.equals("()!", (!c()).s)
    Assert.equals("[]!", (!c[c]).s)
    Assert.equals("! **", (!c**c).s)
    Assert.equals("! *", (!c*c).s)
    Assert.equals("! /", (!c/c).s)
    Assert.equals("! %", (!c%c).s)
    Assert.equals("! +", (!c+c).s)
    Assert.equals("! -", (!c-c).s)
    Assert.equals("! <<", (!c<<c).s)
    Assert.equals("! >>", (!c>>c).s)
    Assert.equals("! <", (!c<c).s)
    Assert.equals("! <=", (!c<=c).s)
    Assert.equals("! >", (!c>c).s)
    Assert.equals("! >=", (!c>=c).s)
    Assert.equals("! ==", (!c==c).s)
    Assert.equals("! !=", (!c!=c).s)
    Assert.equals("! &", (!c&c).s)
    Assert.equals("! ^", (!c^c).s)
    Assert.equals("! |", (!c|c).s)

    Assert.equals("()-", (-c()).s)
    Assert.equals("[]-", (-c[c]).s)
    Assert.equals("- **", (-c**c).s)
    Assert.equals("- *", (-c*c).s)
    Assert.equals("- /", (-c/c).s)
    Assert.equals("- %", (-c%c).s)
    Assert.equals("- +", (-c+c).s)
    Assert.equals("- -", (-c-c).s)
    Assert.equals("- <<", (-c<<c).s)
    Assert.equals("- >>", (-c>>c).s)
    Assert.equals("- <", (-c<c).s)
    Assert.equals("- <=", (-c<=c).s)
    Assert.equals("- >", (-c>c).s)
    Assert.equals("- >=", (-c>=c).s)
    Assert.equals("- ==", (-c==c).s)
    Assert.equals("- !=", (-c!=c).s)
    Assert.equals("- &", (-c&c).s)
    Assert.equals("- ^", (-c^c).s)
    Assert.equals("- |", (-c|c).s)
}
