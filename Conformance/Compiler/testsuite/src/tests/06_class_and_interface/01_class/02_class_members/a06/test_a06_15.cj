/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a06_15

  @Level:         1

  @Assertion: 6.1.2(6)
              Note the following: - All static members are not accessible by instance name.

  @Description: Check that a public static mutable property can not be accesed by an instance name

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

class A {
  public static mut prop a: Int64 {
    get() {
      1
    }
    set(v) {}
  }

  static func check() {
    let x = A()
    x.a
  }
}

main() {
  A.check()
}