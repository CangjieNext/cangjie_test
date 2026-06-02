/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a14_01

  @Level:         1

  @Assertion:   8.1.2(14)
                class Foo {
                  public func f() {}
                }
                interface I {
                  func f(): Unit
                }
                extend Foo <: I {} // ok
                extend Foo {
                  public func g(): Unit {
                    print("In extend!")
                  }
                }
                interface I2 {
                  func g(): Unit {
                    print("In interface!")
                  }
                }
                extend Foo <: I2 {} // ok, default implementation of g in I2 is no longer used

  @Description: Checks that example is compiled and executed w/o errors.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single


*/


import utils.assert.Assert

var stdout = ""

class Foo {
    public func f() {}
}

interface I {
    func f(): Unit
}

extend Foo <: I {} // ok

extend Foo {
    public func g(): Unit {
        stdout += "In extend!"
        print("In extend!")
    }
}

interface I2 {
    func g(): Unit {
        stdout += "In interface!"
        print("In interface!")
    }
}

extend Foo <: I2 {} // ok, default implementation of g in I2 is no longer used

main() {
    Foo().g()
    Assert.equals("In extend!", stdout)
}
