/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a12_05

  @Level:         1

  @Assertion: 6.1.2.3(12)
              protected: The variable can only be accessed within this package or in a subclass.

  @Description: Check that a protected immutable static variable
                is not visible outside the package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a12_aux.cj

*/

import a12.*

main() {
    A12Aux.s2
}