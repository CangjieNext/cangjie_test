/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_a05_01

  @Level:         1

  @Assertion:    14.2(5) Finally, Cangjie provides rich code operation interfaces for users 
                 to conveniently transform code.

  @Description:  Check that macros can be used to transform code
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

main(): Unit {
    var right_code = @AddType(var cj_variable = 25)
    Assert.equals("var cj_variable: Int64 = 25", right_code)
}
