/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_02_a01_04

  @Level:         1

  @Assertion:    11.2(1) In the Cangjie programming language, the modifier public is used to 
                 manage the accessibility of all top-level definitions or declarations.
                 Accessibility refers to whether it can be accessed in other packages. 
 
  @Description:  Check that definitions or declarations without `public` keyword cannot be 
                 accessed in other packages. content inside public top-level variables

  @Mode:         compileonly

  @Negative:     yes  

  @Structure:    complex-main

  @Dependencies: aux_test_a01_02.cj
 
 */

import pkga2.*

main() {
    pkga2.AuxTestA0102.PI
    return 0
}
