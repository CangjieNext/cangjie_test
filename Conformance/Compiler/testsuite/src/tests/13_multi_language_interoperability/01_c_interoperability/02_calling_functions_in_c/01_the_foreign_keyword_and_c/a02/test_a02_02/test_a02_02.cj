/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a02_02

  @Level:         1

  @Assertion:    13.1.2.1(2)  The foreign functions can only exist in the
                 top-level scope and is only visible inside the package,
                 so no other function modifiers can be used.

  @Description:  Check that foreign function is not visible outside package.
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: mod/foreign.cj

  @Comment:      

*/

import mod.ff

main() {
  print(ff(12))
}