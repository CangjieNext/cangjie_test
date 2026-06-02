/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a26_01

  @Level:         1

  @Assertion:    14.2.2(26) 2. If the macro invocation appears in the context of the expected token sequence 
                 (As the parameters of macro invocation expression), the macro is called at the moment when the
                 token sequence is evaluated. In addition, the return value (the token sequence) of the macro 
                 invocation is directly used instead of being expanded into program text.   

  @Description:  Check that parameters of macro invocation expression expect token sequence and the return value
                 (the token sequence) of the macro invocation is directly used instead of being expanded into 
                 program text
   
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros_01.*


main(): Unit {
    Assert.isTrue(@is_tokens(@letDecl(str)))
}
