/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a38_01

  @Level:         1

  @Assertion: 6.1.2.1(38)
              public: default modifier of a constructor,
              indicating that the constructor can be accessed outside the class.

  @Description: Check that a constructor modified with 'public' can be invoked everywhere

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a38_aux.cj

  @Issue: 0006208

*/

import utils.assert.Assert

import a38.*

var global = ""

class A {
  public init(x: String) {
    global = x
  }

  static func check_inside() {
    let case3 = A("SUB")
    Assert.equals("SUB", global)
  }
}

class B <: A38Aux {
  static func check_subclass() {
    remote_call = false
    let case4 = A38Aux()
    Assert.equals(true, remote_call)
  }
}

main() {
  // Can call constructor in the current package outside the class
  let case1 = A("AB")
  Assert.equals("AB", global)

  // Can call constructor from outside the package
  let case2 = A38Aux()
  Assert.equals(true, remote_call)

  // Can call constructor inside its class
  A.check_inside()

  // Can call constructor in a subclass from outside the package
  B.check_subclass()
}