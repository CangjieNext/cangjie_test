/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_a02_01

  @Level:         1

  @Assertion: 6.2(2)
              A type is said to implement an interface if it declares that it implements an interface
              and implements all the members in that interface.

  @Description: Check that a class can implement an interface

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

// Empty interfaces
interface I1 {}
class C1 <: I1 {}

interface I2<T> {}
class C2 <: I2<Bool> {}

interface I3<T> {}
class C3<T> <: I3<T> {}

// Interfaces with abstract functions
interface I4 {
    func f(): Unit
}
class C4 <: I4 {
    public func f() {}
}

interface I5<T> {
    operator func ==(rhs: I5<T>): Bool
}
class C5 <: I5<Rune> {
    public operator func ==(rhs: I5<Rune>) {
        return false
    }
}

interface I6<T> {
    func f(x: T): Int64
}
class C6<T> <: I6<T> {
    public func f(x: T) {
        return 1
    }
}

// Interfaces with abstract functions with default implementation
interface I7 {
    func f() {}
}
class C7 <: I7 {}

interface I8<T> {
    func f() {}
}
class C8 <: I8<Unit> {}

interface I9<T> {
    func f() {}
}
class C9<T> <: I9<T> {}

// Interfaces with functions that are both abstract and have an implementation
interface I10 {
    func f() {}
    func g(x: Int64): Int64
}
class C10 <: I10 {
    public func g(x: Int64) {
        return 1
    }
}

interface I11<T> {
    func f() {}
    func g(x: Int64): Int64
}
class C11 <: I11<Bool> {
    public func g(x: Int64) {
        return 1
    }
}

interface I12<T> {
    func f() {}
    func g(x: T): Int64
}
class C12<T> <: I12<T> {
    public func g(x: T) {
        return 1
    }
}

// Interfaces with abstract properties
interface I13 {
    prop p: Int64
}
class C13 <: I13 {
    public prop p: Int64 {
        get() {
            1
        }
    }
}

interface I14<T> {
    prop p: Int64
}
class C14 <: I14<String> {
    public prop p: Int64 {
        get() {
            1
        }
    }
}

interface I15<T> {
    prop p: Int64
}
class C15<T> <: I15<T> {
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
class C16 <: I16 {}

interface I17<T> {
    prop p: Int64 {
        get() {
            10
        }
    }
}
class C17 <: I17<Unit> {}

interface I18<T> {
    mut prop p: Int64 {
        get() {
            10
        }
        set(v) {}
    }
}
class C18<T> <: I18<T> {}

// Interfaces with properties that are both abstract and have an implementation
interface I19 {
    prop p: Int64 {
        get() {
            10
        }
    }
    mut prop q: Bool
}
class C19 <: I19 {
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
class C20 <: I20<Float16> {
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
class C21<T> <: I21<T> {
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
class C22 <: I22 {
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
class C23 <: I23<Rune> {
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
class C24<T> <: I24<T> {
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
    let c1 = C1()
    Assert.isTrue(c1 is I1)

    let c2 = C2()
    Assert.isTrue(c2 is I2<Bool>)

    let c3 = C3<Rune>()
    Assert.isTrue(c3 is I3<Rune>)

    let c4 = C4()
    Assert.isTrue(c4 is I4)

    let c5 = C5()
    Assert.isTrue(c5 is I5<Rune>)

    let c6 = C6<Unit>()
    Assert.isTrue(c6 is I6<Unit>)

    let c7 = C7()
    Assert.isTrue(c7 is I7)

    let c8 = C8()
    Assert.isTrue(c8 is I8<Unit>)

    let c9 = C9<Float64>()
    Assert.isTrue(c9 is I9<Float64>)

    let c10 = C10()
    Assert.isTrue(c10 is I10)

    let c11 = C11()
    Assert.isTrue(c11 is I11<Bool>)

    let c12 = C12<Array<Bool>>()
    Assert.isTrue(c12 is I12<Array<Bool>>)

    let c13 = C13()
    Assert.isTrue(c13 is I13)

    let c14 = C14()
    Assert.isTrue(c14 is I14<String>)

    let c15 = C15<Int16>()
    Assert.isTrue(c15 is I15<Int16>)

    let c16 = C16()
    Assert.isTrue(c16 is I16)

    let c17 = C17()
    Assert.isTrue(c17 is I17<Unit>)

    let c18 = C18<(Rune, Bool)>()
    Assert.isTrue(c18 is I18<(Rune, Bool)>)

    let c19 = C19()
    Assert.isTrue(c19 is I19)

    let c20 = C20()
    Assert.isTrue(c20 is I20<Float16>)

    let c21 = C21<Range<Int64>>()
    Assert.isTrue(c21 is I21<Range<Int64>>)

    let c22 = C22()
    Assert.isTrue(c22 is I22)

    let c23 = C23()
    Assert.isTrue(c23 is I23<Rune>)

    let c24 = C24<IntNative>()
    Assert.isTrue(c24 is I24<IntNative>)
}