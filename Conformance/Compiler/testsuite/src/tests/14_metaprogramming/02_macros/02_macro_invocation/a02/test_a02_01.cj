/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a02_01

  @Level:         1

  @Assertion:    14.2.2(2) - Use the keyword @ to define the macro invocation expression.

  @Description:  Check that the keyword @ must be the start of macro invocation expression
  
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    @letDecl(v1)

    let v2 = @PI(Float32)
}
