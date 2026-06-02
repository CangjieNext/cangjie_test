/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a13_59

  @Level:         1

  @Assertion: 6.1.1.2(13)
              A child class inherits all the members of its super class, except private members and constructors.

  @Description: Check that a child class can not access a private mutable property of its sealed superclass 

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124, 0006084

*/

sealed class A {
  private mut prop x: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}

class B <: A {
  func test() {
    var y = x
  }
}

main() {
}
