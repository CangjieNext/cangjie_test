/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a11_02

  @Level:         1

  @Assertion:    14.2.4(11) A macro definition cannot invoke itself as a macro, directly or indirectly.  

  @Description:  Check that macro definition cannot indirectly invoke itself as a macro 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_02.cj

*/

import aux_macros_02.*
import aux_macros_03.*

main(): Unit {
    let t = @M2(0)
}
