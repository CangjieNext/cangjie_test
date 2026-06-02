/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_03_a06_02

  @Level:         1

  @Assertion:    14.2.3(6) Specially, only macro packages can be public import in macro packages,
                 macro packages can only be public import in macro packages.
 
  @Description:  Check that the macro package cannot be public imported from other simple package
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Module:       default

  @Dependencies: aux_macros_01.cj

*/

import std.ast.*
public import aux_macros_01.*


main(): Unit {
    @stub(0)
    var a = @compile(0)
    var b = @aux_macros_01.compile(0)
}
