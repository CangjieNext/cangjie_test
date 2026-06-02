/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a03_03

  @Level:         1

  @Assertion: 6.1.1.1(3)
              public class AuxExample {} // can be accessed outside the package
              class C2 {} // can only be accessed inside the package

  @Description: Check that the non-public class from the example can not be accessed from another package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: aux_example.cj

*/

package another_not_a03

import a03.*

main() {
  var c2 = C2()
}
