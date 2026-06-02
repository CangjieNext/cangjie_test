/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a18_01

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

  @Description:  Check that macro invocation can appear in all these statements
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

// interface declaration
@addModif[public]
interface I1 {
    // function declaration
    @addModif[static]
    func foo(): Int64
}

// struct declaration
@addModif[public]
struct S1 {}

// enum declaration
@addModif[public]
enum E1 { A }

// class declaration
@addModif[public]
class C1 {
    // variable declaration
    @addModif[public]
    var class_member = 77
}

// extension declaration
extend C1{
    @funcWrap(55)
}


main(): Unit {}
