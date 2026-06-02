/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a30_07

  @Level:         1

  @Assertion: 6.1.2.1(30)
              A primary constructor is a syntax sugar of regular constructor.
              The compiler automatically generates a definition of the constructor
              and member variables corresponding to the main constructor,
              the form of the automatically generated constructor is as follows:
              • The modifier is the same as that of the primary constructor.
              • The sequence of parameters from left to right is the same as that of parameters
                declared in the primary constructor parameter list.
              • The constructor body is in the following format:
                – Assign values to member variables in sequence.
                  The syntax format is this.x = x, where x indicates the member variable name.
                – The code in the primary constructor body.

  @Description: Check that constructors generated from a public primary constructors
                are visible inside the class, inside a subclass, 
                outside in the current package and outside of the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a30_pos.cj

*/

import utils.assert.Assert

import a30_pos.*

var local_call = false

open class Local {
  public Local() {
    local_call = true
  }

  static func test() {
    Assert.isFalse(local_call)
    let tst = Local()
  }
}

class Child <: Local {
  static func test() {
    Assert.isFalse(local_call)
    let tst = Local()
  }
}

main() {
  Local.test()
  Assert.isTrue(local_call)
  local_call = false

  Child.test()
  Assert.isTrue(local_call)
  local_call = false

  let tst1 = Local()
  Assert.isTrue(local_call)

  Assert.isFalse(remote_call)
  let tst2 = Alien()
  Assert.isTrue(remote_call)
}