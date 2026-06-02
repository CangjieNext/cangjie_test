/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a05_02

  @Level:         1

  @Assertion:    14.2.4(5) For situations where it’s important that an inner macro call finds itself nested inside a
                 particular outer macro call, the inner macro can call the library function assertParentContext, 
                 which will throw an error unless the inner macro call is nested in the given outer macro call. 
 
  @Description:  Check that the assertParentContext function will throw an error
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @Issue:        0006253

*/

import aux_macros_01.*

main(): Unit {
    let t = @Inner(4)
}
