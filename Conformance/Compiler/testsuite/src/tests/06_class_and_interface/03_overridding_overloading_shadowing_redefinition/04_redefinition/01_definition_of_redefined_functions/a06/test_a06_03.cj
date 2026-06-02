/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a06_03

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(6)
              Same function redefines several functions in the super classes, each follows the above rules.

  @Description: Check that a class can redefine several functions with one function
                even when all redefined functions have different return types
                as long as the return type of the redefining function is a subtype of them all

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
    static func f(): Any
    static func g<T>(): Any
}

interface I2 {
    static func f(): Object
    static func g<T>(): Object
}

abstract class A {
    public static func f(): Parent {
        return Parent(0)
    }
    public static func g<T>(): Parent {
        return Parent(0)
    }
}

class T1 <: A & I1 & I2 {
    public redef static func f(): Child {
        return Child(10)
    }
    public redef static func g<T>(): Child {
        return Child(20)
    }
}

main() {
    Assert.equals(10, T1.f().y)
    Assert.equals(20, T1.g<Unit>().y)
}