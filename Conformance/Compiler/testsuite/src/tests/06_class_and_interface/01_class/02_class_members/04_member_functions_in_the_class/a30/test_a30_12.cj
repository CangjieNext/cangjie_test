/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a30_12

  @Level:         1

  @Assertion: 6.1.2.4(30)
              protected: A function declared with modifier protected
              can only be accessed in this package or in this class and its subclasses.

  @Description: Check that a protected static member function
                with parameters and with the Unit return type
                can not be accessed from another package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a30_aux.cj

*/

import a30.*

main() {
    Remote.f10(1)
}