/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_03_a08_01

  @Level:         1

  @Assertion:    14.2.3(8) In the same package, the conventions for macros with the same name are 
                 the same as those for functions.

  @Description:  Check that it is OK to have attribute macro and non-attribute macro
                 with the same name in the same package.
  
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj aux_macros_02.cj

*/

import aux_macros_01.*

main(): Unit {
    @stub(0)
    @stub[0](0)
}
