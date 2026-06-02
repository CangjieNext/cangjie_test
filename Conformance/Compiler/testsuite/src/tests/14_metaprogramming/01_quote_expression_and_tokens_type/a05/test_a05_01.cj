/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_01_a05_01

  @Level:         1

  @Assertion:    14.1(5) Macro invocations are considered to be code and are not treated specially.

  @Description:  Checking the macro invocations is a code
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

var G_str = @Concat["abc"]("def")

main(): Unit {
    Assert.isTrue(G_str is String)
    Assert.equals("abcdef", G_str)

    var name = "user"
    var mail = "mail_agent"
    var str = @Concat[name]("@" + mail)

    Assert.isTrue(str is String)
    Assert.equals("user@mail_agent", str)
}