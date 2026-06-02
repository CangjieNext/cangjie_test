/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a16_05

  @Level:         1

  @Assertion:    14.2.2(16) The following is an example of a macro invocation without an attribute, one with an 
                 attribute, and one without parentheses.
                  ...

  @Description:  Check negative example code
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @Issue:        0006068

*/

import std.ast.*
import aux_macros_01.*

func foo()
{
    print("In foo\n")
}

main(): Unit {
    @Joint[](foo())
}
