/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_01_a13_06

  @Level:         1

  @Assertion:    14.2.1(13) Once a macro is defined, the macro name cannot be assigned any value.

  @Description:  Check that macro name cannot be assigned quote value
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import std.ast.*
import aux_macros_01.macroName

main(): Unit {
    macroName = quote(55)
}
