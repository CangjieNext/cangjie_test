/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a15_01

  @Level:         1

  @Assertion:    14.2.2(15)  In addition, for macro invocations without parentheses, its arguments must also meet the 
                 following requirements:
                  - If the parameter is a declaration, the macro invocation can only appear where a 
                  declaration is allowed.

  @Description:  Check that macroInputExprWithoutParens is not allowed where the expression that follows it
                 is not allowed
   
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    @compile
    static var a = 1
}
