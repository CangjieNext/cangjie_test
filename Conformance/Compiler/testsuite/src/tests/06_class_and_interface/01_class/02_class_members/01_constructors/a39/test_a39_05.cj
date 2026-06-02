/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a39_05

  @Level:         1

  @Assertion: 6.1.2.1(39)
              private: indicates that the constructor can be accessed only within the class.

  @Description: Check that a constructor modified with 'private' can not be invoked
                in a subclass otuside its package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a39_aux.cj

*/

import a39.*

class B <: A39Aux {
  init() {
    super(1)
  }

  static func test() {
    let a = A39Aux()
  }
}

main() {
  B.test()
}