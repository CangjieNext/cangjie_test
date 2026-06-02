/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a41_03

  @Level:         1

  @Assertion: 6.1.2.1(41)
              default: no modifier means that it can only be accessed within the current package

  @Description: Check that a constructor without modifiers cannot be invoked
                in a subclass outside the package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a41_aux.cj

*/

import a41.*

class A <: A41Aux {
  init() {
    super(1)
  }

  static func test() {
    let r = A41Aux()
  }
}

main() {
  A.test()
}