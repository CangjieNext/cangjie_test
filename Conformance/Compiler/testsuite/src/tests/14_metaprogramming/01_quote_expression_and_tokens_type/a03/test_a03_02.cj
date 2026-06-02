/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a03_02

  @Level:         1

  @Assertion:   14.1(3) - The quote expression is enclosed by (). 

  @Description: Negative check that quote requires ()
  
  @Mode:        compileonly

  @Negative:    yes

*/

import std.ast.*

main(): Unit {
    var t = quote expr
}