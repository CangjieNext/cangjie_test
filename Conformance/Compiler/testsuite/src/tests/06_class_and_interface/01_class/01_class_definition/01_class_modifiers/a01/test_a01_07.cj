/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a01_07

  @Level:         1

  @Assertion: 6.1.1.1(1)
              Access modifier: If no access modifier is used when defining a class, 
              then the class can only be accessed inside the package.

  @Description: Check that a generic class with abstract modifier can not be accessed from another package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: aux_test_a01_07.cj

*/

import pkg_a01_07.*

class B <: A<Int32> {}

main() {
  var b = B()
}
