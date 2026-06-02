/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a01_09

  @Level:         1

  @Assertion: 6.3.2(1)
              Class/Interface does not allow overload between static and instance member functions.
              If the names of static member functions and instance member functions
              (including those defined by the class/interface
              and inherited from super class or super interface) of a class/interface are the same,
              a compilation error is reported.

  @Description: Check that overloading is allowed in generic classes and interfaces between instance functions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1<U> {
    func f() {
        return 1
    }
    func f(x: Int64): Int64
}

interface I2<U> {
    func f(x: Rune) {
        return 3
    }

    func f(x: String): Int64
}

interface I3<U> <: I2<U> {
    func f(x: Bool) {
        return 5
    }
    func f(x: Unit): Int64
}

abstract class A<U> {
    func f(x: Rune, y: Rune) {
        return 7
    }
    public func f(x: String, y!: Rune): Int64

    func f<T>(x: T, y: T, z: U) {
        return 11
    }
    func f<T>(x: Range<Int64>) {
        return 12
    }
}

class B<U> <: A<U> & I1<U> & I3<U> {
    public func f(x: Int64) {
        return 2
    }
    public func f(x: String) {
        return 4
    }
    public func f(x: Unit) {
        return 6
    }
    public func f(x: String, y!: Rune) {
        return 8
    }

    func f(x: () -> Int64) {
        return 9
    }
    func f(x: () -> Int32) {
        return 10
    }

    func f<T>(x: Array<Bool>) {
        return 13
    }
    func f<T>(x: Float32) {
        return 14
    }
}

main() {
    let case1 = B<Int8>()
    Assert.equals(1, case1.f())
    Assert.equals(2, case1.f(1))
    Assert.equals(3, case1.f(r'o'))
    Assert.equals(4, case1.f("sret"))
    Assert.equals(5, case1.f(false))
    Assert.equals(6, case1.f(()))
    Assert.equals(7, case1.f(r']', r')'))
    Assert.equals(8, case1.f("fasf", y: r'v'))
    Assert.equals(9, case1.f({ => 1i64}))
    Assert.equals(10, case1.f({ => 1i32}))
    Assert.equals(11, case1.f((), (), 1i8))
    Assert.equals(12, case1.f<Unit>(1..10:1))
    Assert.equals(13, case1.f<Unit>([false, true]))
    Assert.equals(14, case1.f<Unit>(0.1f32))
}