/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a05_01

  @Level:         1

  @Assertion: 6.1.1.4(5)
              A class can define only one static initializer.

  @Description: Check that defining one static initializer is legal

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006136

*/

import utils.assert.Assert

class OneStaticInitializer {
  static var str = ""
  static let chr: Rune

  static init() {
    str = "str"
    chr = r'c'
  }
}

class MoreElements {
  static var a: Int64
  static let b: Int64
  static init() {
    a = 1
    b = 2
  }
  MoreElements() {}
  func some_func() {}
  private func another_func() {}
}

class GenericStaticInit<T> {
  static init() {
    b = true
  }
  static let b: Bool
}

class NoStaticMembers {
  static init() {}

  let x = 1
  let y = 1.2551e-17
  let z = "fffffff"
}

main() {
  Assert.equals("str", OneStaticInitializer.str)
  Assert.equals(r'c', OneStaticInitializer.chr)

  Assert.equals(1, MoreElements.a)
  Assert.equals(2, MoreElements.b)

  Assert.equals(true, GenericStaticInit<Unit>.b)
}
