/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a21_01

  @Level:         1

  @Assertion:    14.2.2(21) Macro expansion indicates that the macro definition is executed during code compilation.  

  @Description:  Check that macro is executed during code compilation
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @Comment:      The compilation succeeds because the @pass macro is executed with the compilation process completed. 
                 Without @pass macro call the compilation will end with error: division by 0

  @Issue:        0006505

*/

import std.ast.*
import aux_macros_01.*

main(): Int64 {
    @pass(0)
    1/0       // error: division by 0
}
