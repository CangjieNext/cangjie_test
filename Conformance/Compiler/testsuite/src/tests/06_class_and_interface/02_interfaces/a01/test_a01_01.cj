/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_a01_01

  @Level:         1

  @Assertion: 6.2(1)
              An interface is used to define an abstract type that contains no data,
              but can define the behavior of the type.

  @Description: Check that interfaces with functions and with no data can be defined

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

// Empty interfaces
interface I1 {}

interface I2<T> {}

interface I3<T> where T <: Any {}

interface I4 <: I1 {}

interface I5<T> <: I2<T> {}

interface I6<T> <: I3<T> where T <: Object {}

// Interfaces with abstract functions
interface I7 {
    func f(): Int64
    func g(x: Int64): String
}

interface I8<T> {
    func f(x: T): T
    operator func +(rhs: I8<T>): Int64
}

interface I9<T> where T <: Any {
    func f(): Bool
}

interface I10 <: I7 {
    func z(): Unit
}

interface I11<T> <: I8<T> {
    func g(x: T): Unit
    operator func -(): I11<T>
}

interface I12<T> <: I9<T> where T <: Any {
    func g(a: Int64, b!: Bool): Unit
}

// Interfaces with functions with default implementation
interface I13 {
    static func f() {}
    func g() {}
}

interface I14<T> {
    static func s<U>() {}
}

interface I15<T> {
    operator func [](idx: Int64) {
        return idx + 1
    }
}

interface I16 <: I13 {
    static func m() {}
}

interface I17<T> <: I14<T> {
    static func s<U>() {}
}

interface I18<T> <: I15<T> {
    func k() {
        return 1
    }
}

class TypeTester<T> {}

main() {
    // Check that interface types were successfully created
    let t1 = TypeTester<I1>()
    Assert.isTrue(t1 is TypeTester<I1>)

    let t2 = TypeTester<I2<Int64>>()
    Assert.isTrue(t2 is TypeTester<I2<Int64>>)

    let t3 = TypeTester<I3<Float16>>()
    Assert.isTrue(t3 is TypeTester<I3<Float16>>)

    let t4 = TypeTester<I4>()
    Assert.isTrue(t4 is TypeTester<I4>)

    let t5 = TypeTester<I5<Array<Rune>>>()
    Assert.isTrue(t5 is TypeTester<I5<Array<Rune>>>)

    let t6 = TypeTester<I6<Future<Bool>>>()
    Assert.isTrue(t6 is TypeTester<I6<Future<Bool>>>)

    let t7 = TypeTester<I7>()
    Assert.isTrue(t7 is TypeTester<I7>)

    let t8 = TypeTester<I8<String>>()
    Assert.isTrue(t8 is TypeTester<I8<String>>)

    let t9 = TypeTester<I9<Object>>()
    Assert.isTrue(t9 is TypeTester<I9<Object>>)

    let t10 = TypeTester<I10>()
    Assert.isTrue(t10 is TypeTester<I10>)

    let t11 = TypeTester<I11<Bool>>()
    Assert.isTrue(t11 is TypeTester<I11<Bool>>)

    let t12 = TypeTester<I12<Unit>>()
    Assert.isTrue(t12 is TypeTester<I12<Unit>>)

    let t13 = TypeTester<I13>()
    Assert.isTrue(t13 is TypeTester<I13>)

    let t14 = TypeTester<I14<Nothing>>()
    Assert.isTrue(t14 is TypeTester<I14<Nothing>>)

    let t15 = TypeTester<I15<Int64>>()
    Assert.isTrue(t15 is TypeTester<I15<Int64>>)

    let t16 = TypeTester<I16>()
    Assert.isTrue(t16 is TypeTester<I16>)

    let t17 = TypeTester<I17<Rune>>()
    Assert.isTrue(t17 is TypeTester<I17<Rune>>)

    let t18 = TypeTester<I18<Int64>>()
    Assert.isTrue(t18 is TypeTester<I18<Int64>>)
}