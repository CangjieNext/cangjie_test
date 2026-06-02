/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a03_04

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            A primary constructor definition including the following:

  @Assertion: 6.1.2.1(3)
              Modifier: optional. Primary constructors can be modified with one of
              public, protected, or private, none of which are visible within the package.
              See Access Modifiers for details

  @Description: Check that classes with a constructor with any modifier can be created inside the class.

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

  static func check_inside() {
    let t = Public()
    Assert.equals(1, constructor_counter)
  }
}

public class PublicGeneric<T> {
  public PublicGeneric() {
    constructor_counter++
  }

  static func check_inside() {
    let t = PublicGeneric<Float32>()
    Assert.equals(2, constructor_counter)
  }
}

public class PublicWithParams {
  public PublicWithParams(x: Int64) {
    constructor_counter += x
  }

  static func check_inside() {
    let t = PublicWithParams(10)
    Assert.equals(12, constructor_counter)
  }
}

public class Protected {
  protected Protected() {
    constructor_counter++
  }

  static func check_inside() {
    let t = Protected()
    Assert.equals(13, constructor_counter)
  }
}

public class ProtectedGeneric<T> {
  protected ProtectedGeneric() {
    constructor_counter++
  }

  static func check_inside() {
    let t = ProtectedGeneric<Bool>()
    Assert.equals(14, constructor_counter)
  }
}

public class ProtectedWithParams {
  protected ProtectedWithParams(x: Int64) {
    constructor_counter += x
  }

  static func check_inside() {
    let t = ProtectedWithParams(10)
    Assert.equals(24, constructor_counter)
  }
}

public class Private {
  private Private() {
    constructor_counter++
  }

  static func check_inside() {
    let t = Private()
    Assert.equals(25, constructor_counter)
  }
}

public class PrivateGeneric<T> {
  private PrivateGeneric() {
    constructor_counter++
  }

  static func check_inside() {
    let t = PrivateGeneric<Rune>()
    Assert.equals(26, constructor_counter)
  }
}

public class PrivateWithParams {
  private PrivateWithParams(x: Int64) {
    constructor_counter += x
  }

  static func check_inside() {
    let t = PrivateWithParams(14)
    Assert.equals(40, constructor_counter)
  }
}

public class NoMods {
  NoMods() {
    constructor_counter++
  }

  static func check_inside() {
    let t = NoMods()
    Assert.equals(41, constructor_counter)
  }
}

public class NoModsGeneric<T> {
  NoModsGeneric() {
    constructor_counter++
  }

  static func check_inside() {
    let t = NoModsGeneric<Unit>()
    Assert.equals(42, constructor_counter)
  }
}

public class NoModsWithParams {
  NoModsWithParams(x: Int64) {
    constructor_counter += x
  }

  static func check_inside() {
    let t = NoModsWithParams(58)
    Assert.equals(100, constructor_counter)
  }
}

main() {
  Assert.equals(0, constructor_counter)

  Public.check_inside()

  PublicGeneric<Int32>.check_inside()

  PublicWithParams.check_inside()

  Protected.check_inside()

  ProtectedGeneric<String>.check_inside()

  ProtectedWithParams.check_inside()

  Private.check_inside()

  PrivateGeneric<Bool>.check_inside()

  PrivateWithParams.check_inside()

  NoMods.check_inside()

  NoModsGeneric<String>.check_inside()

  NoModsWithParams.check_inside()
}
