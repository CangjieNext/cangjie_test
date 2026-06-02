/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a18_02

  @Level:         1

  @Assertion:    14.2.2(18)  In addition, macro invoking can appear in the following statements: 
                  function declaration,
                  struct declaration,
                  enum declaration,
                  class declaration,
                  interface declaration,
                  variable declaration (except function parameter declaration),
                  attribute declaration,
                  and extension declaration.

  @Description:  Check thah macro invoking cannot appear in the function parameter declaration
   
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

func foo(@compile(var a: Int64)) {
    return a
}

main(): Unit {}
