/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_03_a09_01

  @Level:         1

  @Assertion:    14.2.3(9) The following table lists the rules for attribute macros and non-attribute macros.
                     Same name, Same package           attribute macros      non-attribute macros
                     attribute macros                  NO                    YES
                     non-attribute macros              YES                   NO


  @Description:  Check that you can have macros with the same name if they are of different kinds
  
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
