/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a22_01

  @Level:         1

  @Assertion:    14.2.2(22) The execution result is parsed into a syntax tree to replace the macro invocation
                 expression.    

  @Description:  Check that valid code after macro invocation does not cause errors
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

@compile(func foo() { return 567 })

main(): Unit {
    foo()
}
