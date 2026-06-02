/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a25_01

  @Level:         1

  @Assertion:    14.2.2(25) 1. If the macro invocation appears in the context of the expected expression or
                 declaration, the macro invocation is expanded into program text at compile time.   

  @Description:  Check that macro invocation is expanded into program text
   
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

let G_const = 567_i32

@funcDecl[foo](return G_const)

main(): Unit {
    Assert.equals(G_const, foo())
    Assert.isTrue(foo is ()->Int32)
}
