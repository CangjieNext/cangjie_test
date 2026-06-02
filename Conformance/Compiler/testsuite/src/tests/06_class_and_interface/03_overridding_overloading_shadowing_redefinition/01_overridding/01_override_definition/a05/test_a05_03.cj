/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a05_03

  @Level:         1

  @Assertion: 6.3.1.1(5)
              Same function overrides several functions in the superclasses,
              each follows the above rules.

  @Description: Check that a class can override several functions with one function
                even when all overridden functions have different return types
                as long as the return type of the overriding function is a subtype of them all

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006426

*/

import utils.assert.Assert

open class Parent {
    Parent(let x: Int64) {}
}
class Child <: Parent {
    Child(let y: Int64) {
        super(0)
    }
}

interface I1 {
    func f(): Any
}

interface I2 {
    func f(): Object
}

abstract class A {
    public func f(): Parent
}

class T1 <: A & I1 & I2 {
    public override func f(): Child {
        return Child(10)
    }
}

main() {
    Assert.equals(10, T1().f().y)
}