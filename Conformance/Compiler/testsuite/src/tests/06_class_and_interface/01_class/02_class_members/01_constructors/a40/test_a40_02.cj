/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a40_02

  @Level:         1

  @Assertion: 6.1.2.1(40)
              protected: indicates that the constructor can only be accessed
              in the current package or in subclasses outside the current package.

  @Description: Check that a constructor modified with 'protected'
                can not be invoked outside its package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a40_aux.cj

*/

import a40.*

main() {
  let r = A40Aux()
}