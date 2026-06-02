/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a03_02

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            A primary constructor definition including the following:

  @Assertion: 6.1.2.1(3)
              Modifier: optional. Primary constructors can be modified with one of
              public, protected, or private, none of which are visible within the package.
              See Access Modifiers for details

  @Description: Check that a class with a public constructor can be created in other packages
                and a class with a protected constructor can be create in subclasses in other packages.

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a03_02_aux.cj

  @Comment: There is no description on what modifiers do for primary constructors.
            This behavior is inferred from the fact that the compiler converts primary constructors into
            init constructors and the description of modifiers for init constructors

  @Issue: 0006179

*/

import utils.assert.Assert

import p02.*

class FromAnotherPackage <: Protected {
  static func test() {
    var case4 = Protected()
    Assert.equals(13, constructor_counter)
  }
}

main() {
  Assert.equals(0, constructor_counter)

  var case1 = A()
  Assert.equals(1, constructor_counter)

  var case2 = AGeneric<Int64>()
  Assert.equals(2, constructor_counter)

  var case3 = ConstWithParams(10)
  Assert.equals(12, constructor_counter)

  FromAnotherPackage.test()
}
