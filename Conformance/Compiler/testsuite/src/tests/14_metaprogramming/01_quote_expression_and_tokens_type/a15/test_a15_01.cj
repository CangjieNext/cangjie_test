/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_01_a15_01

  @Level:         1

  @Assertion:    14.1(15) The operator + combines (non-destructively) two token sequences into a single one.

  @Description:  Check the operator +
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

main(): Unit {
    Assert.isTrue(@CompileTest1())
    Assert.isTrue(@CompileTest2())
}
