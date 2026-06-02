/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a20_01

  @Level:         1

  @Assertion:    14.2.2(20) The macro invocation expression is replaced by the code after the macro is expanded during
                 compilation.  

  @Description:  Check that macro invocation expression is replaced by the code after the macro is expanded during
                 compilation
   
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

@letDecl[G_const](363475684)
var G_re_const = G_const     // w/o error: undeclared identifier 'G_const'

main(): Unit {
    Assert.equals(363475684, G_re_const)
}
