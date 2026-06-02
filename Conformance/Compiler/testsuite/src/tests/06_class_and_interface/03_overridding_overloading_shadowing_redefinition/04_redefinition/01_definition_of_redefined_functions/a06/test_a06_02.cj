/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a06_02

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(6)
              Same function redefines several functions in the super classes, each follows the above rules.

  @Description: Check that a class can redefine several functions with one function
                if the redefined functions have the same name, parameter list and return type.
                The subclass changes the return type to a subtype of the original return type

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006426, 0006084

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
    static func f(): Parent
    static func g<T>(x: Int64): Parent
}

interface I2 {
    static func f() {
        return Parent(0)
    }
    static func g<T>(x: Int64) {
        return Parent(0)
    }
}

interface I3 {
    static func f() {
        return Parent(0)
    }
    static func g<T>(x: Int64) {
        return Parent(0)
    }
}

abstract class A {
    public static func f() {
        return Parent(0)
    }
    public static func g<T>(x: Int64) {
        return Parent(0)
    }
}

open class B {
    public static func f() {
        return Parent(0)
    }
    public static func g<T>(x: Int64) {
        return Parent(0)
    }
}

sealed abstract class C {
    static func f() {
        return Parent(0)
    }
    static func g<T>(x: Int64) {
        return Parent(0)
    }
}

// Abstract functions with and without default implementation
class T1 <: I1 & I2 {
    public redef static func f(): Child {
        return Child(11)
    }
    public redef static func g<T>(x: Int64): Child {
        return Child(12)
    }
}

// Functions with default implementation from interfaces
class T2 <: I2 & I3 {
    public redef static func f(): Child {
        return Child(21)
    }
    public redef static func g<T>(x: Int64): Child {
        return Child(22)
    }
}

// Non-abstract functions
class T3 <: A & I1 {
    public redef static func f(): Child {
        return Child(31)
    }
    public redef static func g<T>(x: Int64): Child {
        return Child(32)
    }
}

// Everything
class T4 <: A & I1 & I2 & I3 {
    public redef static func f(): Child {
        return Child(41)
    }
    public redef static func g<T>(x: Int64): Child {
        return Child(42)
    }
}

class T5 <: B & I1 & I2 & I3 {
    public redef static func f(): Child {
        return Child(51)
    }
    public redef static func g<T>(x: Int64): Child {
        return Child(52)
    }
}

class T6 <: C & I1 & I2 & I3 {
    public redef static func f(): Child {
        return Child(61)
    }
    public redef static func g<T>(x: Int64): Child {
        return Child(62)
    }
}

main() {
    Assert.equals(11, T1.f().y)
    Assert.equals(12, T1.g<Unit>(1).y)

    Assert.equals(21, T2.f().y)
    Assert.equals(22, T2.g<Unit>(1).y)

    Assert.equals(31, T3.f().y)
    Assert.equals(32, T3.g<Unit>(1).y)

    Assert.equals(41, T4.f().y)
    Assert.equals(42, T4.g<Unit>(1).y)

    Assert.equals(51, T5.f().y)
    Assert.equals(52, T5.g<Unit>(1).y)

    Assert.equals(61, T6.f().y)
    Assert.equals(62, T6.g<Unit>(1).y)
}
