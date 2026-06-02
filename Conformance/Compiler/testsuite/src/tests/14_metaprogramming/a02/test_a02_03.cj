/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_a02_03

  @Level:         1

  @Assertion:    14(2)Therefore, Cangjie programming language provides the tokens type for describing code,
                 supporting basic operations of converting code into data, concatenating code, and macro for
                 code transformation during compilation.

  @Description:  Check macro generated code during compilation
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

main(): Unit {
    var m_code = @Add[3](2)     // 5 = 3 + 2
    Assert.equals(5, m_code)
}
