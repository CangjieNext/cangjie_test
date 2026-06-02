/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_03_a02_02

  @Level:         1

  @Assertion:    14.2.3(2) Packages with macro declarations, must be modified with macro, 
                 in another word, we use macro package to define a package with macro declarations.
 
  @Description:  Check that the macro cannot be defined in a package not modified with macro
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_02.cj

*/

import std.ast.*
import aux_macros_02.*

main(): Unit {
    @stub(0)
}
