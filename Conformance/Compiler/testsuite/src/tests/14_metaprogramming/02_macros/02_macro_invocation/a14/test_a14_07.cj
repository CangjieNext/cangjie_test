/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a14_07

  @Level:         1

  @Assertion:    14.2.2(14) For macro invocations without parentheses, the parameter must be one of the following 
                 declarations or expressions:
                  - Function declaration
                  - Struct declaration
                  - Enum definition
                  - Enum constructor
                  - Class declaration
                  - Static initializer
                  - primary init functions and init functions in structs and classes
                  - Interface declaration
                  - Property definition
                  - Extend definition
                  - Variable declaration (except function parameters)
                  - Macro invocation expression

  @Description:  Negative check that macro calls without parentheses must be followed by an expression or declaration
   
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

func foo() { 1 }

main(): Unit {
    // The macroInputExprWithoutParens cannot be followed by a function invocations
    @compile
    foo()
}
