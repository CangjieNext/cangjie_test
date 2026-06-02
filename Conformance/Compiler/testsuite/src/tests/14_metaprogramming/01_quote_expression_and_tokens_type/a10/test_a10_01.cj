/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  
  @Name:        14_01_a10_01

  @Level:         1

  @Assertion:   14.1(10) Consecutive quote without code interpolation is not allowed. For details
                about code interpolation, see the next section. 

  @Description: Check that the consecutive quote without code interpolation is not allowed
  
  @Mode:        compileonly

  @Negative:    no

  @Issue:       0006501

*/

import std.ast.*

main(): Unit {
    quote(quote(quote(3)))
}
