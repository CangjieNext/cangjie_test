/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a05_01

  @Level:         1

  @Assertion:    14.2.2(5) - When a macro with attributes is invoked, the macro attributes are enclosed in []. 

  @Description:  Check that the macro attributes are enclosed in []
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    @funcDecl[foo](return 1)
    foo()
}
