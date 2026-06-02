/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a13_01

  @Level:         1

  @Assertion:    14.2.4(13) Note: Macro recursion  and  function  recursion  have  similar  need  for  a  termination
                 condition/base  case. Otherwise, an infinite loop will occur and the compilation will not complete. 

  @Description:  Check that the macro recursion without a terminator will cause an infinite loop

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @ExpectTimeout

  @Issue:        0006254

*/

import aux_macros_01.*

main(): Unit {
    let t = @M1(0)
}
