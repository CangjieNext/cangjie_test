
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_01_a02_06

  @Level:         1

  @Assertion: 4.1(2) For collective literals and tuple literals (see Value
              Types), whose value is the value of the literal obtained by 
              evaluating all expressions within it, and whose type is 
              determined by its syntax.
  @Description: Checks value and type of the unit literal.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var u = ()
    Assert.isTrue(u is Unit)
    if( u != ()) {
        Assert.fail(reason: "Should be equal.")
    }
}

