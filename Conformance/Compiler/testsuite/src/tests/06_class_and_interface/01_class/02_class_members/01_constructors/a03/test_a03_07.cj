/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a03_07

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            A primary constructor definition including the following:

  @Assertion: 6.1.2.1(3)
              Modifier: optional. Primary constructors can be modified with one of
              public, protected, or private, none of which are visible within the package.
              See Access Modifiers for details

  @Description: Check that a class with a private constructor can not be instantiated from another package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a03_07_aux.cj

  @Comment: There is no description on what modifiers do for primary constructors.
            This behavior is inferred from the fact that the compiler converts primary constructors into
            init constructors and the description of modifiers for init constructors

  @Issue: 0006179

*/

import p07.*

main() {
  let a = A()
}
