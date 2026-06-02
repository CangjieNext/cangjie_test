/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a44_03

  @Level:         1

  @Assertion: 6.1.2.1(44)
              A class may contain multiple constructors
              as long as the constructors satisfy the requirements of function overloading.

  @Description: Check that a class can not contain two constructors with the same signature

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  init(y: Int64) {}
  init(x: Int64) {
    print(1)
  }
}

main() {
}