/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a03_03

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            A primary constructor definition including the following:

  @Assertion: 6.1.2.1(3)
              Modifier: optional. Primary constructors can be modified with one of
              public, protected, or private, none of which are visible within the package.
              See Access Modifiers for details

  @Description: Check that classes with protected, public and non-modified constructors
                can be created in the same package.

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: There is no description on what modifiers do for primary constructors.
            This behavior is inferred from the fact that the compiler converts primary constructors into
            init constructors and the description of modifiers for init constructors

  @Issue: 0006179

*/

import utils.assert.Assert

public var constructor_counter = 0

public class Public {
  public Public() {
    constructor_counter++
  }
}

public class PublicGeneric<T> {
  public PublicGeneric() {
    constructor_counter++
  }
}

public class PublicWithParams {
  public PublicWithParams(x: Int64) {
    constructor_counter += x
  }
}

public class Protected {
  protected Protected() {
    constructor_counter++
  }
}

public class ProtectedGeneric<T> {
  protected ProtectedGeneric() {
    constructor_counter++
  }
}

public class ProtectedWithParams {
  protected ProtectedWithParams(x: Int64) {
    constructor_counter += x
  }
}

public class NoMods {
  NoMods() {
    constructor_counter++
  }
}

public class NoModsGeneric<T> {
  NoModsGeneric() {
    constructor_counter++
  }
}

public class NoModsWithParams {
  NoModsWithParams(x: Int64) {
    constructor_counter += x
  }
}

main() {
  Assert.equals(0, constructor_counter)

  var case1 = Public()
  Assert.equals(1, constructor_counter)

  var case2 = PublicGeneric<Int64>()
  Assert.equals(2, constructor_counter)

  var case3 = PublicWithParams(10)
  Assert.equals(12, constructor_counter)

  var case4 = Protected()
  Assert.equals(13, constructor_counter)

  var case5 = ProtectedGeneric<String>()
  Assert.equals(14, constructor_counter)

  var case6 = ProtectedWithParams(6)
  Assert.equals(20, constructor_counter)

  var case7 = NoMods()
  Assert.equals(21, constructor_counter)

  var case8 = NoModsGeneric<String>()
  Assert.equals(22, constructor_counter)

  var case9 = NoModsWithParams(78)
  Assert.equals(100, constructor_counter)
}
