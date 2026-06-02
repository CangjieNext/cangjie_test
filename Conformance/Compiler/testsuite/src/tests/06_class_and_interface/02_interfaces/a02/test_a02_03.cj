/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * Eopyright (c). 2023-2023. All rights reserved.
 */

/*
  @Name: 06_02_a02_03

  @Level:         1

  @Assertion: 6.2(2)
              A type is said to implement an interface if it declares that it implements an interface
              and implements all the members in that interface.

  @Description: Check that an enum can implement an interface

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

// Empty interfaces
interface I1 {}
enum E1 <: I1 {
    VAL1(Int64) | VAL2(Float64)
}

interface I2<T> {}
enum E2 <: I2<Bool> {
    VAL1(Int64) | VAL2(Float64)
}

interface I3<T> {}
enum E3<T> <: I3<T> {
    VAL1(Int64) | VAL2(Float64)
}

// Interfaces with abstract functions
interface I4 {
    func f(): Unit
}
enum E4 <: I4 {
    VAL1(Int64) | VAL2(Float64)
    public func f() {}
}

interface I5<T> {
    operator func ==(rhs: I5<T>): Bool
}
enum E5 <: I5<Rune> {
    VAL1(Int64) | VAL2(Float64)
    public operator func ==(rhs: I5<Rune>) {
        return false
    }
}

interface I6<T> {
    func f(x: T): Int64
}
enum E6<T> <: I6<T> {
    VAL1(Int64) | VAL2(Float64)
    public func f(x: T) {
        return 1
    }
}

// Interfaces with abstract functions with default implementation
interface I7 {
    func f() {}
}
enum E7 <: I7 {
    VAL1(Int64) | VAL2(Float64)
}

interface I8<T> {
    func f() {}
}
enum E8 <: I8<Unit> {
    VAL1(Int64) | VAL2(Float64)
}

interface I9<T> {
    func f() {}
}
enum E9<T> <: I9<T> {
    VAL1(Int64) | VAL2(Float64)
}

// Interfaces with functions that are both abstract and have an implementation
interface I10 {
    func f() {}
    func g(x: Int64): Int64
}
enum E10 <: I10 {
    VAL1(Int64) | VAL2(Float64)
    public func g(x: Int64) {
        return 1
    }
}

interface I11<T> {
    func f() {}
    func g(x: Int64): Int64
}
enum E11 <: I11<Bool> {
    VAL1(Int64) | VAL2(Float64)
    public func g(x: Int64) {
        return 1
    }
}

interface I12<T> {
    func f() {}
    func g(x: T): Int64
}
enum E12<T> <: I12<T> {
    VAL1(Int64) | VAL2(Float64)
    public func g(x: T) {
        return 1
    }
}

// Interfaces with abstract properties
interface I13 {
    prop p: Int64
}
enum E13 <: I13 {
    VAL1(Int64) | VAL2(Float64)
    public prop p: Int64 {
        get() {
            1
        }
    }
}

interface I14<T> {
    prop p: Int64
}
enum E14 <: I14<String> {
    VAL1(Int64) | VAL2(Float64)
    public prop p: Int64 {
        get() {
            1
        }
    }
}

interface I15<T> {
    prop p: Int64
}
enum E15<T> <: I15<T> {
    VAL1(Int64) | VAL2(Float64)
    public prop p: Int64 {
        get() {
            1
        }
    }
}

// Interfaces with properties with default implementations
interface I16 {
    prop p: Int64 {
        get() {
            10
        }
    }
}
enum E16 <: I16 {
    VAL1(Int64) | VAL2(Float64)
}

interface I17<T> {
    prop p: Int64 {
        get() {
            10
        }
    }
}
enum E17 <: I17<Unit> {
    VAL1(Int64) | VAL2(Float64)
}

interface I18<T> {
    prop p: Int64 {
        get() {
            10
        }
    }
}
enum E18<T> <: I18<T> {
    VAL1(Int64) | VAL2(Float64)
}

// Interfaces with properties that are both abstract and have an implementation
interface I19 {
    prop p: Int64 {
        get() {
            10
        }
    }
    prop q: Bool
}
enum E19 <: I19 {
    VAL1(Int64) | VAL2(Float64)
    public prop q: Bool {
        get() {
            true
        }
    }
}

interface I20<T> {
    prop p: Int64 {
        get() {
            10
        }
    }
    prop q: Rune
}
enum E20 <: I20<Float16> {
    VAL1(Int64) | VAL2(Float64)
    public prop q: Rune {
        get() {
            r'q'
        }
    }
}

interface I21<T> {
    prop p: Int64 {
        get() {
            10
        }
    }
    prop q: String
}
enum E21<T> <: I21<T> {
    VAL1(Int64) | VAL2(Float64)
    public prop q: String {
        get() {
            ""
        }
    }
}

// Interfaces with everything
interface I22 {
    func f() {
        return 1
    }
    func g(): Unit
    prop p: Int64 {
        get() {
            10
        }
    }
    prop q: Bool
}
enum E22 <: I22 {
    VAL1(Int64) | VAL2(Float64)
    public func g() {}
    public prop q: Bool {
        get() {
            true
        }
    }
}

interface I23<T> {
    func f() {
        return 1
    }
    func g(): Unit
    prop p: Int64 {
        get() {
            10
        }
    }
    prop q: Rune
}
enum E23 <: I23<Rune> {
    VAL1(Int64) | VAL2(Float64)
    public func g() {}
    public prop q: Rune {
        get() {
            r'q'
        }
    }
}

interface I24<T> {
    func f() {
        return 1
    }
    func g(x: T): Int64
    prop p: Int64 {
        get() {
            10
        }
    }
    prop q: String
}
enum E24<T> <: I24<T> {
    VAL1(Int64) | VAL2(Float64)
    public func g(x: T) {
        return 5
    }
    public prop q: String {
        get() {
            ""
        }
    }
}

main() {
    let c1 = E1.VAL1(1)
    Assert.isTrue(c1 is I1)

    let c2 = E2.VAL1(1)
    Assert.isTrue(c2 is I2<Bool>)

    let c3 = E3<Rune>.VAL1(1)
    Assert.isTrue(c3 is I3<Rune>)

    let c4 = E4.VAL1(1)
    Assert.isTrue(c4 is I4)

    let c5 = E5.VAL1(1)
    Assert.isTrue(c5 is I5<Rune>)

    let c6 = E6<Unit>.VAL1(1)
    Assert.isTrue(c6 is I6<Unit>)

    let c7 = E7.VAL1(1)
    Assert.isTrue(c7 is I7)

    let c8 = E8.VAL1(1)
    Assert.isTrue(c8 is I8<Unit>)

    let c9 = E9<Float64>.VAL1(1)
    Assert.isTrue(c9 is I9<Float64>)

    let c10 = E10.VAL1(1)
    Assert.isTrue(c10 is I10)

    let c11 = E11.VAL1(1)
    Assert.isTrue(c11 is I11<Bool>)

    let c12 = E12<Array<Bool>>.VAL1(1)
    Assert.isTrue(c12 is I12<Array<Bool>>)

    let c13 = E13.VAL1(1)
    Assert.isTrue(c13 is I13)

    let c14 = E14.VAL1(1)
    Assert.isTrue(c14 is I14<String>)

    let c15 = E15<Int16>.VAL1(1)
    Assert.isTrue(c15 is I15<Int16>)

    let c16 = E16.VAL1(1)
    Assert.isTrue(c16 is I16)

    let c17 = E17.VAL1(1)
    Assert.isTrue(c17 is I17<Unit>)

    let c18 = E18<(Rune, Bool)>.VAL1(1)
    Assert.isTrue(c18 is I18<(Rune, Bool)>)

    let c19 = E19.VAL1(1)
    Assert.isTrue(c19 is I19)

    let c20 = E20.VAL1(1)
    Assert.isTrue(c20 is I20<Float16>)

    let c21 = E21<Range<Int64>>.VAL1(1)
    Assert.isTrue(c21 is I21<Range<Int64>>)

    let c22 = E22.VAL1(1)
    Assert.isTrue(c22 is I22)

    let c23 = E23.VAL1(1)
    Assert.isTrue(c23 is I23<Rune>)

    let c24 = E24<IntNative>.VAL1(1)
    Assert.isTrue(c24 is I24<IntNative>)
}