/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_03_a09_03

  @Level:         1

  @Assertion:    14.2.3(9) The following table lists the rules for attribute macros and non-attribute macros.
                     Same name, Same package           attribute macros      non-attribute macros
                     attribute macros                  NO                    YES
                     non-attribute macros              YES                   NO


  @Description:  Check that you cannot have macros with the same name if they are both non-attribute macros
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_03.cj aux_macros_04.cj

*/

import aux_macros_02.*

main(): Unit {
    @stub(0)
}
