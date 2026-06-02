/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a01_06

  @Level:         1

  @Assertion: 6.2.1.2(1)
              Access modifier: If no access modifier is used when defining an interface,
              then the interface can only be accessed inside the package

  @Description: Check that a non-generic interface with the default access modifier
                can not be implemented by an enum in another package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a01_aux.cj

*/

import a01.*

enum A <: I1 {
    O(String) | N(Rune)
}

main() {
}