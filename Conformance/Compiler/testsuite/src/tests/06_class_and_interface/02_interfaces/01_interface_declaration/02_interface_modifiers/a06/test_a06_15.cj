/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a06_15

  @Level:         1

  @Assertion: 6.2.1.2(6)
              You can also use the sealed modifier to indicate that the interface can be inherited,
              implemented, or extended only in the package which the interface is defined.

  @Description: Check that a generic sealed interface not modified with 'public'
                can be implemented by an enum outside the package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a06_aux.cj

  @Issue: 0006084, 0006345

*/

import a06.*

enum A <: I2<Unit> {
    E1(String) | E2(Rune)
}

main() {
}
