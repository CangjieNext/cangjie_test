/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a23_02

  @Level:         1

  @Assertion:    14.2.2(23) After semantic analysis, the replaced node has corresponding type information. 
                 The type can be considered as the type of the macro invocation expression.

  @Description:  Check that macro result can be considered as the type
   
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

let G_const = @compile(567_i16)

@compile(func foo(x: Int64): Bool { true })

main(): Unit {
    var r = @compile(34.77_f16)
    Assert.isTrue(G_const is Int16)
    Assert.isTrue(r is Float16)
    Assert.isTrue(foo is (Int64)->Bool)
}
