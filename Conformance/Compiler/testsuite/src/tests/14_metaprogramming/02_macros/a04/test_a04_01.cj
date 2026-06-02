/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_a04_01

  @Level:         1

  @Assertion:    14.2(4) In addition, macros provide the ability to customize the grammar.
                 Users can flexibly define DSL syntax using macros. 

  @Description:  Check that macros can be used to provide the ability to customize the grammar
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

main(): Unit {
    var cpp_code = @ToCpp(var cj_variable: Int64 = 15)
    Assert.equals("long cj_variable = 15", cpp_code)
}
