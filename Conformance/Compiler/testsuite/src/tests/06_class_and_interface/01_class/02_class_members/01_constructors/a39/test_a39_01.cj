/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a39_01

  @Level:         1

  @Assertion: 6.1.2.1(39)
              private: indicates that the constructor can be accessed only within the class.

  @Description: Check that a constructor modified with 'private' can be invoked inside its class

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var global = 0

class A {
  private init(x: Int64) {
    global = x
  }

  static func check_static() {
    let case1 = A(2)
    Assert.equals(2, global)
    case1.check_member()
  }

  func check_member() {
    let case2 = A(10)
    Assert.equals(10, global)
  }
}

main() {
  A.check_static()
}