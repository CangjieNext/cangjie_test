/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a05_01

  @Level:         1

  @Assertion: 6.3.1.1(5)
              Same function overrides several functions in the superclasses,
              each follows the above rules.

  @Description: Check that a class can override several functions with one function
                if the overridden functions have the same name, parameter list and return type

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006426, 0006084

*/

import utils.assert.Assert

public interface I1 {
    func f(): Int64
    func g(x: Int64): Int64
}

public interface I2 {
    func f() {
        return 0
    }
    func g(x: Int64) {
        return 0
    }
}

public interface I3 {
    func f() {
        return 0
    }
    func g(x: Int64) {
        return 0
    }
}

abstract class A {
    public open func f() {
        return 0
    }
    public open func g(x: Int64) {
        return 0
    }
}

abstract class B {
    public func f(): Int64
    public func g(x: Int64): Int64
}

open class C {
    public open func f() {
        return 0
    }
    public open func g(x: Int64) {
        return 0
    }
}

sealed abstract class D {
    public open func f() {
        return 0
    }
    public open func g(x: Int64) {
        return 0
    }
}

// Only abstract functions
class T1 <: A & I1 {
    public override func f() {
        return 11
    }
    public override func g(x: Int64) {
        return 12
    }
}

// Functions with default implementation from interfaces
class T2 <: I2 & I3 {
    public override func f() {
        return 21
    }
    public override func g(x: Int64) {
        return 22
    }
}

// Non-abstract functions
class T3 <: B & I1 {
    public override func f() {
        return 31
    }
    public override func g(x: Int64) {
        return 32
    }
}

// Everything
class T4 <: A & I1 & I2 & I3 {
    public override func f() {
        return 41
    }
    public override func g(x: Int64) {
        return 42
    }
}

class T5 <: B & I1 & I2 & I3 {
    public override func f() {
        return 51
    }
    public override func g(x: Int64) {
        return 52
    }
}

class T6 <: C & I1 & I2 & I3 {
    public override func f() {
        return 61
    }
    public override func g(x: Int64) {
        return 62
    }
}

class T7 <: D & I1 & I2 & I3 {
    public override func f() {
        return 71
    }
    public override func g(x: Int64) {
        return 72
    }
}

main() {
    Assert.equals(11, T1().f())
    Assert.equals(12, T1().g(1))

    Assert.equals(21, T2().f())
    Assert.equals(22, T2().g(1))

    Assert.equals(31, T3().f())
    Assert.equals(32, T3().g(1))

    Assert.equals(41, T4().f())
    Assert.equals(42, T4().g(1))

    Assert.equals(51, T5().f())
    Assert.equals(52, T5().g(1))

    Assert.equals(61, T6().f())
    Assert.equals(62, T6().g(1))

    Assert.equals(71, T7().f())
    Assert.equals(72, T7().g(1))
}
