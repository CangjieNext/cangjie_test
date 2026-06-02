/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a07_07

  @Level:         1

  @Assertion: 6.1.1.4(7)
              A class can define only one primary constructor or not.

  @Description: Check that a class can not define two primary constructors with different signatures
                alongside other class members

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  A() {
    a = 1
  }
  A(x: Int64) {
    a = x
  }
  let a: Int64

  operator func()() {}
}

main() {
}
