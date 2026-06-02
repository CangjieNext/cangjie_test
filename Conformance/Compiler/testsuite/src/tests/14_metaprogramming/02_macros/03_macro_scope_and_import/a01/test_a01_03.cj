/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_03_a01_03

  @Level:         1

  @Assertion:    14.2.3(1) The macro must be defined at the top-level of a source file and its scope is 
                 the entire package.
 
  @Description:  Check that the macro cannot be defined at the struct-level of a source file
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_03.cj

*/

import std.ast.*
import aux_macros_03.*

main(): Unit {
    @stub(0)
}
