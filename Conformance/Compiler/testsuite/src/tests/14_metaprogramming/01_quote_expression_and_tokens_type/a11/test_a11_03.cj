/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_01_a11_03

  @Level:         1

  @Assertion:    14.1(11) When the quote expression references the following token, escape is required:
                 - The quote expression does not support unmatched parentheses. However, the parentheses are
                   escaped through \ and are not counted in the matching rule.
                 - If @ indicates a common token instead of a macro invocation expression, use \ to escape.
                 - If $ indicates a common token instead of code interpolation, use \ to escape.

  @Description:  Negative check of the operation of the required escaping
  
  @Mode:         compileonly

  @Negative:     yes

*/

import std.ast.*

main(): Unit {
    // When the quote expression references the following token, escape is required
    (((((quote(\(())))))
}
