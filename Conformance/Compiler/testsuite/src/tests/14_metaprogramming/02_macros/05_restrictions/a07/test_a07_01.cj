/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_05_a07_01

  @Level:         1

  @Assertion:    14.2.5(7) The invoked macro also requires that the definition point and call point be located 
                 in different packages.

  @Description:  Check that invoked macro also requires that the definition point and call point be located 
                 in different packages

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

main(): Unit {
    let r = @Inner(0)
}
