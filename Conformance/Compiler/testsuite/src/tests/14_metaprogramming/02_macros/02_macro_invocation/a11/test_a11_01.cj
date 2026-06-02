/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a11_01

  @Level:         1

  @Assertion:    14.2.2(11) - If @ is referenced in the macro invocation expression parameter, the \ must be escaped.

  @Description:  Check escaping of @ in macro expression
   
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros_01.*

main(): Unit {
    let r = @quoteWrap(\@compile(0))
    Assert.isTrue(r[0].kind == TokenKind.AT)
}
