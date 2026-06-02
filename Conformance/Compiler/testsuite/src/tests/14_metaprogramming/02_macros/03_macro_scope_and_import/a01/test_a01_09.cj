/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:           14_02_03_a01_09

  @Level:         1

  @Assertion:      14.2.3(1) The macro must be defined at the top-level of a source file and its scope is 
                   the entire package.
 
  @Description:    Сheck that the scope of the macro is not other packages
  
  @Mode:           compileonly

  @Negative:       yes

  @Structure:      complex-main

  @CompileWarning: Ignore

  @Dependencies:   aux_macros_08_01.cj aux_macros_08_02.cj aux_macros_09.cj

*/

import std.ast.*
import aux_macros_08.*
import aux_macros_09.*

main(): Unit {
    @aux_macros_09.compile(0)
}
