/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_01_a11_01

  @Level:         1

  @Assertion:    14.1(11) When the quote expression references the following token, escape is required:
                 - The quote expression does not support unmatched parentheses. However, the parentheses are
                   escaped through \ and are not counted in the matching rule.
                 - If @ indicates a common token instead of a macro invocation expression, use \ to escape.
                 - If $ indicates a common token instead of code interpolation, use \ to escape.

  @Description:  Positive check of escaping operation
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

main(): Unit {
    /* The quote expression does not support unmatched parentheses. However, the parentheses are
       escaped through \ and are not counted in the matching rule.
    */
    var up0 = quote(\() + quote(\))
    var up1 = (quote( ) + quote( \)))
    var up2 = ((((((((quote(\()))))))))

    Assert.equals("()", up0.toString())
    Assert.equals(")", up1.toString())
    Assert.equals("(", up2.toString())

    // If @ indicates a common token instead of a macro invocation expression, use \ to escape.
    Assert.equals(quote(@domain("mail")).toString(), quote(\@domain("mail")).toString())

    // If $ indicates a common token instead of code interpolation, use \ to escape.
    var x = 3
    var ci0 = quote(x)
    var ci1 = quote($x)
    var ci2 = quote(\$x)
    var ci3 = quote(\$(x))
    var ci4 = quote($(x))

    Assert.equals("x", ci0.toString())
    Assert.equals("3", ci1.toString())
    Assert.equals("$x", ci2.toString())
    Assert.equals("$(x)", ci3.toString())
    Assert.equals("3", ci4.toString())
}
