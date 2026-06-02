/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a40_01

  @Level:         1

  @Assertion: 6.1.2.1(40)
              protected: indicates that the constructor can only be accessed
              in the current package or in subclasses outside the current package.

  @Description: Check that a constructor modified with 'protected'
                can be invoked everywhere inside the package and in a subclass from outside the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a40_aux.cj

*/

import utils.assert.Assert

import a40.*

var global = ""

class A {
  protected init(x: String) {
    global = x
  }

  static func check_inside() {
    let case3 = A("Inside")
    Assert.equals("Inside", global)
  }
}

class B <: A40Aux {
  static func check_subclass() {
    remote_call = false
    let case4 = A40Aux()
    Assert.equals(true, remote_call)
  }
}

main() {
  // Can call constructor in the current package outside the class
  let case1 = A("Outside")
  Assert.equals("Outside", global)

  // Can call constructor inside its class
  A.check_inside()

  // Can call constructor in a subclass from outside the package
  B.check_subclass()
}