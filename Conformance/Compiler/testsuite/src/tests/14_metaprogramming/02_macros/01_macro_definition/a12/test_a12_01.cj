/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_01_a12_01

  @Level:         1

  @Assertion:    14.2.1(12) The following is an example of a macro with attributes. Compared with non-attribute macros,
                 the macro definition has an additional input of the Tokens type. Therefore, operations can 
                 be performed more flexibly.

                 public macro foo(attr: Tokens, x: Tokens): Tokens { attr + x }

                 public macro bar(attr: Tokens, x: Tokens): Tokens {
                     return quote($attr + $x)
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
    var r1 = @foo[-](2)
    var r2 = @bar[3](4)
}
