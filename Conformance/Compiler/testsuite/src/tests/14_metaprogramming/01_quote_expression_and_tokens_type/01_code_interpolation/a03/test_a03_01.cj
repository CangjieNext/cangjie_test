/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a03_01

  @Level:         1

  @Assertion:   14.1.1(3) This operator is parsed as a unary prefix operator and may be
                used only in quote expressions.

  @Description: Check that operator $ is parsed as a unary prefix operator
  
  @Mode:        compileonly

  @Negative:    yes

*/

import std.ast.*

main(): Unit {
    var x = 3
    quote((x)$) // don`t be postfix
}
