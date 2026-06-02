/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a05_14

  @Level:         1

  @Assertion: 6.1.1.4(5)
              A class can define only one static initializer.

  @Description: Check that in a generic class defining two static initializers without parameters
                and with other class members is illegal

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006136

*/

class A<T> {
  static init() {}
  A() {}
  static init() {
    print(1)
  }
  let x = 1
}

main() {
}
