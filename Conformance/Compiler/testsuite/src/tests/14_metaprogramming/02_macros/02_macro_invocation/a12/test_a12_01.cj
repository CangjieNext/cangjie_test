/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a12_01

  @Level:         1

  @Assertion:    14.2.2(12) The parentheses can be omitted when a macro invocation is used 
                 before some declarations or expressions.

  @Description:  Check that macro invocation can be used without parentheses
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    @compile
    func test() {return "test"}

    var a = test()
}
