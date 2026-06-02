/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a13_28

  @Level:         1

  @Assertion: 6.1.1.2(13)
              A child class inherits all the members of its super class, except private members and constructors.

  @Description: Check that a child class can not access a private static immutable variable of its abstract generic superclass 

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A<T> {
  static private let x = 1
}

class B <: A<Unit> {
  func test() {
    var y = x
  }
}

main() {
}
