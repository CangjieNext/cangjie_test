/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_01_a11_01

  @Level:         1

  @Assertion:    14.2.1(11) The following is an example of a macro without attributes. It contains all the elements of
                the macro definition. public indicates that the macro definition is visible to the outside of
                the package. macro keyword; foo is the identifier of the macro. Formal parameter x and its type Tokens;
                The return value is the same as the input value and type.
                  public macro foo(x: Tokens): Tokens { x }
                  public macro bar(x: Tokens): Tokens {
                      return quote($x)         // or just `return x`
                  }

  @Description:  Check example
  
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import std.ast.*
import aux_macros_01.*

main(): Unit {
    var r1 = @foo(1)
    var r2 = @bar(2)
}
