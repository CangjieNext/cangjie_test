/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a07_16

  @Level:         1

  @Assertion: 6.1.1.4(7)
              A class can define only one primary constructor or not.

  @Description: Check that a generic class can not define several primary constructors with the same signature
                alongside other class members

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A<W, V> {
  A(x: Bool) {}
  let a = 5
  A(x: Bool) {
    print(x)
  }
  A(x: Bool) {
    var a = x
  }
  A(x: Bool) {}
  static func sf() {}
  A(x: Bool) {}
  func f() {}
  A(x: Bool) {}
}

main() {
}
