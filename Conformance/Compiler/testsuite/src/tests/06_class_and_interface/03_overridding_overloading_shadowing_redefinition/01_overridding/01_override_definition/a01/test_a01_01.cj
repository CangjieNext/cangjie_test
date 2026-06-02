/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a01_01

  @Level:         1

  @Assertion: 6.3.1.1(1)
              If a non-abstract and instance function
              with a name same as a function in the superclass is declared,
              the function can be declared with an optional modifier override
              (indicating that it overwrites the existing one).

  @Description: Check that the modifier 'override' is optional for functions
                that override functions from the supertype

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006425, 0006426

*/

import utils.assert.Assert

abstract class A {
    public open func f1() {}
    public open func f2() {
        return 0
    }
    public open func f3(x: String) {}
    public open func f4(x: String) {
        return 0
    }

    public open func g1():Unit
    public open func g2(): Int64
    public open func g3(x: String): Unit
    public open func g4(x: String): Int64
}

interface I {
    func i1() {}
    func i2() {
        return 0
    }
    func i3(x: String) {}
    func i4(x: String) {
        return 0
    }

    func j1():Unit
    func j2(): Int64
    func j3(x: String): Unit
    func j4(x: String): Int64
}

class C1 <: A & I {
    public override func f1() {}
    public override func f2() {
        return 1
    }
    public override func f3(x: String) {}
    public override func f4(x: String) {
        return 2
    }

    public override func g1() {}
    public override func g2() {
        return 3
    }
    public override func g3(x: String) {}
    public override func g4(x: String) {
        return 4
    }

    public override func i1() {}
    public override func i2() {
        return 5
    }
    public override func i3(x: String) {}
    public override func i4(x: String) {
        return 6
    }

    public override func j1() {}
    public override func j2() {
        return 7
    }
    public override func j3(x: String) {}
    public override func j4(x: String) {
        return 8
    }
}

class C2 <: A & I {
    public func f1() {}
    public func f2() {
        return 11
    }
    public func f3(x: String) {}
    public func f4(x: String) {
        return 12
    }

    public func g1() {}
    public func g2() {
        return 13
    }
    public func g3(x: String) {}
    public func g4(x: String) {
        return 14
    }

    public func i1() {}
    public func i2() {
        return 15
    }
    public func i3(x: String) {}
    public func i4(x: String) {
        return 16
    }

    public func j1() {}
    public func j2() {
        return 17
    }
    public func j3(x: String) {}
    public func j4(x: String) {
        return 18
    }
}

class C3<T> <: A & I {
    public override func f1() {}
    public override func f2() {
        return 21
    }
    public override func f3(x: String) {}
    public override func f4(x: String) {
        return 22
    }

    public override func g1() {}
    public override func g2() {
        return 23
    }
    public override func g3(x: String) {}
    public override func g4(x: String) {
        return 24
    }

    public override func i1() {}
    public override func i2() {
        return 25
    }
    public override func i3(x: String) {}
    public override func i4(x: String) {
        return 26
    }

    public override func j1() {}
    public override func j2() {
        return 27
    }
    public override func j3(x: String) {}
    public override func j4(x: String) {
        return 28
    }
}

class C4<T> <: A & I {
    public func f1() {}
    public func f2() {
        return 31
    }
    public func f3(x: String) {}
    public func f4(x: String) {
        return 32
    }

    public func g1() {}
    public func g2() {
        return 33
    }
    public func g3(x: String) {}
    public func g4(x: String) {
        return 34
    }

    public func i1() {}
    public func i2() {
        return 35
    }
    public func i3(x: String) {}
    public func i4(x: String) {
        return 36
    }

    public func j1() {}
    public func j2() {
        return 37
    }
    public func j3(x: String) {}
    public func j4(x: String) {
        return 38
    }
}

main() {
    let c1 = C1()
    Assert.isTrue(c1.f1() is Unit)
    Assert.equals(1, c1.f2())
    Assert.isTrue(c1.f3("") is Unit)
    Assert.equals(2, c1.f4(""))
    Assert.isTrue(c1.g1() is Unit)
    Assert.equals(3, c1.g2())
    Assert.isTrue(c1.g3("") is Unit)
    Assert.equals(4, c1.g4(""))
    Assert.isTrue(c1.i1() is Unit)
    Assert.equals(5, c1.i2())
    Assert.isTrue(c1.i3("") is Unit)
    Assert.equals(6, c1.i4(""))
    Assert.isTrue(c1.j1() is Unit)
    Assert.equals(7, c1.j2())
    Assert.isTrue(c1.j3("") is Unit)
    Assert.equals(8, c1.j4(""))

    let c2 = C2()
    Assert.isTrue(c2.f1() is Unit)
    Assert.equals(11, c2.f2())
    Assert.isTrue(c2.f3("") is Unit)
    Assert.equals(12, c2.f4(""))
    Assert.isTrue(c2.g1() is Unit)
    Assert.equals(13, c2.g2())
    Assert.isTrue(c2.g3("") is Unit)
    Assert.equals(14, c2.g4(""))
    Assert.isTrue(c2.i1() is Unit)
    Assert.equals(15, c2.i2())
    Assert.isTrue(c2.i3("") is Unit)
    Assert.equals(16, c2.i4(""))
    Assert.isTrue(c2.j1() is Unit)
    Assert.equals(17, c2.j2())
    Assert.isTrue(c2.j3("") is Unit)
    Assert.equals(18, c2.j4(""))

    let c3 = C3<Bool>()
    Assert.isTrue(c3.f1() is Unit)
    Assert.equals(21, c3.f2())
    Assert.isTrue(c3.f3("") is Unit)
    Assert.equals(22, c3.f4(""))
    Assert.isTrue(c3.g1() is Unit)
    Assert.equals(23, c3.g2())
    Assert.isTrue(c3.g3("") is Unit)
    Assert.equals(24, c3.g4(""))
    Assert.isTrue(c3.i1() is Unit)
    Assert.equals(25, c3.i2())
    Assert.isTrue(c3.i3("") is Unit)
    Assert.equals(26, c3.i4(""))
    Assert.isTrue(c3.j1() is Unit)
    Assert.equals(27, c3.j2())
    Assert.isTrue(c3.j3("") is Unit)
    Assert.equals(28, c3.j4(""))

    let c4 = C4<String>()
    Assert.isTrue(c4.f1() is Unit)
    Assert.equals(31, c4.f2())
    Assert.isTrue(c4.f3("") is Unit)
    Assert.equals(32, c4.f4(""))
    Assert.isTrue(c4.g1() is Unit)
    Assert.equals(33, c4.g2())
    Assert.isTrue(c4.g3("") is Unit)
    Assert.equals(34, c4.g4(""))
    Assert.isTrue(c4.i1() is Unit)
    Assert.equals(35, c4.i2())
    Assert.isTrue(c4.i3("") is Unit)
    Assert.equals(36, c4.i4(""))
    Assert.isTrue(c4.j1() is Unit)
    Assert.equals(37, c4.j2())
    Assert.isTrue(c4.j3("") is Unit)
    Assert.equals(38, c4.j4(""))
}