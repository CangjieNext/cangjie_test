/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a41_01

  @Level:         1

  @Assertion: 6.1.2.1(41)
              default: no modifier means that it can only be accessed within the current package

  @Description: Check that a constructor without modifiers can be invoked everywhere inside the package

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var global = ""

open class A {
  init(x: String) {
    global = x
  }

  func verifyMember() {
    let case2 = A("Instance")
  }

  static func verifyStatic() {
    let case3 = A("Static")
  }
}

class B <: A {
  init() {
    super("")
  }

  static func verifySubclass() {
    let case4 = A("Subclass")
  }
}

main() {
  // Can call constructor in the current package outside the class
  let case1 = A("Outside")
  Assert.equals("Outside", global)

  case1.verifyMember()
  Assert.equals("Instance", global)

  // Can call constructor inside its class
  A.verifyStatic()
  Assert.equals("Static", global)

  // Can call constructor in a subclass
  B.verifySubclass()
  Assert.equals("Subclass", global)
}