/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_03_a05_03

  @Level:         1

  @Assertion:    14.2.3(5) The rule of importing macro packages is the same as importing common packages.

  @Description:  Check that the macro packages can be imported as common packages

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Module:       default

  @Dependencies: aux_macros_01.cj aux_macros_02.cj

*/

import std.ast.*
import aux_macros_01.* as def_pkg.*
import aux_macros_02.* as aux_pkg.*


main(): Unit {
    @def_pkg.stub(0)
    @aux_pkg.stub(0)
}
