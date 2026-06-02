/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_01_a08_01

  @Level:         1

  @Assertion:    14.2.1(8) - The default return type is Tokens.

  @Description:  Check that macro default return type is Tokens (no error about the mismatched types here)
  
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    var r1 = @macroWithoutAttrParam1(1)
    var r2 = @macroWithAttrParam1[Int8](2)
}
