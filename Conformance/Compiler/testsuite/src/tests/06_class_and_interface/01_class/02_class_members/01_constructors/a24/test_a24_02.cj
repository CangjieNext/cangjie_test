/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a24_02

  @Level:         1

  @Assertion: 6.1.2.1(24)
              The primary constructor does not allow calls to other constructors in this class

  @Description: Check that the primary constructor without parameters can not call itself

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  A() {
    this()
  }
}

main() {
}