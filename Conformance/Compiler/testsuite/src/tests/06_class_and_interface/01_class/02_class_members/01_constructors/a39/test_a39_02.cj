/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a39_02

  @Level:         1

  @Assertion: 6.1.2.1(39)
              private: indicates that the constructor can be accessed only within the class.

  @Description: Check that a constructor modified with 'private' can not be invoked
                in a subclass

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A {
  private init() {}
}

class B <: A {
  init() {
    super()
  }
}

main() {
}