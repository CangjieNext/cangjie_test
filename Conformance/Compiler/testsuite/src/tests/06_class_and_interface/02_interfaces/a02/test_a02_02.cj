/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * Sopyright (c). 2023-2023. All rights reserved.
 */

/*
  @Name: 06_02_a02_02

  @Level:         1

  @Assertion: 6.2(2)
              A type is said to implement an interface if it declares that it implements an interface
              and implements all the members in that interface.

  @Description: Check that a struct can implement an interface

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

// Empty interfaces
interface I1 {}
struct S1 <: I1 {}

interface I2<T> {}
struct S2 <: I2<Bool> {}

interface I3<T> {}
struct S3<T> <: I3<T> {}

// Interfaces with abstract functions
interface I4 {
    func f(): Unit
}
struct S4 <: I4 {
    public func f() {}
}

interface I5<T> {
    operator func ==(rhs: I5<T>): Bool
}
struct S5 <: I5<Rune> {
    public operator func ==(rhs: I5<Rune>) {
        return false
    }
}

interface I6<T> {
    func f(x: T): Int64
}
struct S6<T> <: I6<T> {
    public func f(x: T) {
        return 1
    }
}

// Interfaces with abstract functions with default implementation
interface I7 {
    func f() {}
}
struct S7 <: I7 {}

interface I8<T> {
    func f() {}
}
struct S8 <: I8<Unit> {}

interface I9<T> {
    func f() {}
}
struct S9<T> <: I9<T> {}

// Interfaces with functions that are both abstract and have an implementation
interface I10 {
    func f() {}
    func g(x: Int64): Int64
}
struct S10 <: I10 {
    public func g(x: Int64) {
        return 1
    }
}

interface I11<T> {
    func f() {}
    func g(x: Int64): Int64
}
struct S11 <: I11<Bool> {
    public func g(x: Int64) {
        return 1
    }
}

interface I12<T> {
    func f() {}
    func g(x: T): Int64
}
struct S12<T> <: I12<T> {
    public func g(x: T) {
        return 1
    }
}

// Interfaces with abstract properties
interface I13 {
    prop p: Int64
}
struct S13 <: I13 {
    public prop p: Int64 {
        get() {
            1
        }
    }
}

interface I14<T> {
    prop p: Int64
}
struct S14 <: I14<String> {
    public prop p: Int64 {
        get() {
            1
        }
    }
}

interface I15<T> {
    prop p: Int64
}
struct S15<T> <: I15<T> {
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
struct S16 <: I16 {}

interface I17<T> {
    prop p: Int64 {
        get() {
            10
        }
    }
}
struct S17 <: I17<Unit> {}

interface I18<T> {
    mut prop p: Int64 {
        get() {
            10
        }
        set(v) {}
    }
}
struct S18<T> <: I18<T> {}

// Interfaces with properties that are both abstract and have an implementation
interface I19 {
    prop p: Int64 {
        get() {
            10
        }
    }
    mut prop q: Bool
}
struct S19 <: I19 {
    public mut prop q: Bool {
        get() {
            true
        }
        set(v) {}
    }
}

interface I20<T> {
    prop p: Int64 {
        get() {
            10
        }
    }
    mut prop q: Rune
}
struct S20 <: I20<Float16> {
    public mut prop q: Rune {
        get() {
            r'q'
        }
        set(v) {}
    }
}

interface I21<T> {
    mut prop p: Int64 {
        get() {
            10
        }
        set(v) {}
    }
    mut prop q: String
}
struct S21<T> <: I21<T> {
    public mut prop q: String {
        get() {
            ""
        }
        set(v) {}
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
    mut prop q: Bool
}
struct S22 <: I22 {
    public func g() {}
    public mut prop q: Bool {
        get() {
            true
        }
        set(v) {}
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
    mut prop q: Rune
}
struct S23 <: I23<Rune> {
    public func g() {}
    public mut prop q: Rune {
        get() {
            r'q'
        }
        set(v) {}
    }
}

interface I24<T> {
    func f() {
        return 1
    }
    func g(x: T): Int64
    mut prop p: Int64 {
        get() {
            10
        }
        set(v) {}
    }
    mut prop q: String
}
struct S24<T> <: I24<T> {
    public func g(x: T) {
        return 5
    }
    public mut prop q: String {
        get() {
            ""
        }
        set(v) {}
    }
}

main() {
    let c1 = S1()
    Assert.isTrue(c1 is I1)

    let c2 = S2()
    Assert.isTrue(c2 is I2<Bool>)

    let c3 = S3<Rune>()
    Assert.isTrue(c3 is I3<Rune>)

    let c4 = S4()
    Assert.isTrue(c4 is I4)

    let c5 = S5()
    Assert.isTrue(c5 is I5<Rune>)

    let c6 = S6<Unit>()
    Assert.isTrue(c6 is I6<Unit>)

    let c7 = S7()
    Assert.isTrue(c7 is I7)

    let c8 = S8()
    Assert.isTrue(c8 is I8<Unit>)

    let c9 = S9<Float64>()
    Assert.isTrue(c9 is I9<Float64>)

    let c10 = S10()
    Assert.isTrue(c10 is I10)

    let c11 = S11()
    Assert.isTrue(c11 is I11<Bool>)

    let c12 = S12<Array<Bool>>()
    Assert.isTrue(c12 is I12<Array<Bool>>)

    let c13 = S13()
    Assert.isTrue(c13 is I13)

    let c14 = S14()
    Assert.isTrue(c14 is I14<String>)

    let c15 = S15<Int16>()
    Assert.isTrue(c15 is I15<Int16>)

    let c16 = S16()
    Assert.isTrue(c16 is I16)

    let c17 = S17()
    Assert.isTrue(c17 is I17<Unit>)

    let c18 = S18<(Rune, Bool)>()
    Assert.isTrue(c18 is I18<(Rune, Bool)>)

    let c19 = S19()
    Assert.isTrue(c19 is I19)

    let c20 = S20()
    Assert.isTrue(c20 is I20<Float16>)

    let c21 = S21<Range<Int64>>()
    Assert.isTrue(c21 is I21<Range<Int64>>)

    let c22 = S22()
    Assert.isTrue(c22 is I22)

    let c23 = S23()
    Assert.isTrue(c23 is I23<Rune>)

    let c24 = S24<IntNative>()
    Assert.isTrue(c24 is I24<IntNative>)
}