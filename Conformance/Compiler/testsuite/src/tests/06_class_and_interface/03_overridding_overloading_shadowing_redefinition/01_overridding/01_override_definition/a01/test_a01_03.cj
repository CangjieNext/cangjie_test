/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a01_03

  @Level:         1

  @Assertion: 6.3.1.1(1)
              If a non-abstract and instance function
              with a name same as a function in the superclass is declared,
              the function can be declared with an optional modifier override
              (indicating that it overwrites the existing one).

  @Description: Check that the modifier 'override' is optional for functions
                that override functions with parameters of generic types

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006425, 0006426

*/

import utils.assert.Assert

abstract class A<T1, T2> {
    public open func f(x: T1, y: T2) {
        return 0
    }
    public func g(x: T1, y: T2): Int64
}

interface I<T1, T2> {
    func i(x: T1, y: T2) {
        return 0
    }
    func j(x: T1, y: T2): Int64
}

class C1 <: A<Rune, String> & I<Int64, Bool> {
    public override func f(x: Rune, y: String) {
        return 11
    }
    public override func g(x: Rune, y: String) {
        return 12
    }

    public override func i(x: Int64, y: Bool) {
        return 13
    }
    public override func j(x: Int64, y: Bool) {
        return 14
    }
}

class C2 <: A<Rune, String> & I<Int64, Bool> {
    public func f(x: Rune, y: String) {
        return 21
    }
    public func g(x: Rune, y: String) {
        return 22
    }

    public func i(x: Int64, y: Bool) {
        return 23
    }
    public func j(x: Int64, y: Bool) {
        return 24
    }
}

class C3<T1, T2> <: A<T1, T2> & I<T2, T1> {
    public override func f(x: T1, y: T2) {
        return 31
    }
    public override func g(x: T1, y: T2) {
        return 32
    }

    public override func i(x: T2, y: T1) {
        return 33
    }
    public override func j(x: T2, y: T1) {
        return 34
    }
}

class C4<T1, T2> <: A<T1, T2> & I<T2, T1> {
    public func f(x: T1, y: T2) {
        return 41
    }
    public func g(x: T1, y: T2) {
        return 42
    }

    public func i(x: T2, y: T1) {
        return 43
    }
    public func j(x: T2, y: T1) {
        return 44
    }
}

main() {
    let c1 = C1()
    Assert.equals(11, c1.f(r'a', ""))
    Assert.equals(12, c1.g(r'a', ""))
    Assert.equals(13, c1.i(1, true))
    Assert.equals(14, c1.j(1, true))

    let c2 = C2()
    Assert.equals(21, c2.f(r'a', ""))
    Assert.equals(22, c2.g(r'a', ""))
    Assert.equals(23, c2.i(1, true))
    Assert.equals(24, c2.j(1, true))

    let c3 = C3<Unit, Float64>()
    Assert.equals(31, c3.f((), .1))
    Assert.equals(32, c3.g((), .1))
    Assert.equals(33, c3.i(.1, ()))
    Assert.equals(34, c3.j(.1, ()))

    let c4 = C4<Unit, Float64>()
    Assert.equals(41, c4.f((), .1))
    Assert.equals(42, c4.g((), .1))
    Assert.equals(43, c4.i(.1, ()))
    Assert.equals(44, c4.j(.1, ()))
}