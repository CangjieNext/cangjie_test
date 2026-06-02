/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_a03_01

  @Level:         1

  @Assertion:    14.2(3) Cangjie is responsible for replacing the macro invocation with the target code.
                 You can write code templates (that is, code that generates code) using macros. 

  @Description:  Check that macros can generate code
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

@GenerateClass[open](MyClass)

main(): Unit {
    var cls = MyClass()
    Assert.equals(5, cls.variable)
}
