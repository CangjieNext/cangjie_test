/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a23_01

  @Level:         1

  @Assertion:    14.2.2(23) After semantic analysis, the replaced node has corresponding type information. 
                 The type can be considered as the type of the macro invocation expression.    

  @Description:  Check that macro invocation has associated type
   
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @Issue:        006190

*/

import utils.assert.Assert
import std.ast.*
import aux_macros_01.*

main(): Unit {
    Assert.isTrue(@compile(45_i32) is Int32)
    Assert.isTrue(@Float32Const(0) is Float32)
    Assert.isTrue(@toFloat32(56.5758) is Float32)
}
