/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a06_11

  @Level:         1

  @Assertion: 6.1.2(6)
              Note the following: - All static members are not accessible by instance name.

  @Description: Check that a public static generic function can not be accesed by an instance name

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  public static func f<T>() {}

  static func check() {
    let x = A()
    x.f<Bool>()
  }
}

main() {
  A.check()
}