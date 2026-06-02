/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a23_01

  @Level:         1

  @Assertion: 6.1.2.4(23)
              Static functions in class can declare new generic type parameters
              and the parameters can have constraints.

  @Description: Check that static functions can have generic type parameters and cosntraints

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
    static func f1<T>() {}
    static func f2<U, V>(x: U, y: V) {}
    static func f3<T>() {
        return 1
    }
    static func f4<T1, T2>(x: T1, y: Int64) {
        return y
    }

    static func f5<T, U>() {}
    static func f6<U, V>(x: U, y: V) where U <: ToString, V <: ToString {}
    static func f7<T>() {
        return 1
    }
    static func f8<T1, T2>(x: T1, y: Int64) where T1 <: ToString {
        return "{$x}"
    }
}

class TestG<A, B,C> {
    static func f1<T>() {}
    static func f2<U, V>(x: U, y: V) {}
    static func f3<T>() {
        return 1
    }
    static func f4<T1, T2>(x: T1, y: Int64) {
        return y
    }

    static func f5<T, U>(){}
    static func f6<U, V>(x: U, y: V) where U <: ToString, V <: ToString {}
    static func f7<T>(){
        return 1
    }
    static func f8<T1, T2>(x: T1, y: Int64) where T1 <: ToString {
        return "{$x}"
    }
}

main() {
    Assert.isTrue(Test.f1<Int64> is () -> Unit)
    Assert.isTrue(Test.f2<Rune, String> is (Rune, String) -> Unit)
    Assert.isTrue(Test.f3<Bool> is () -> Int64)
    Assert.isTrue(Test.f4<Unit, Float16> is (Unit, Int64) -> Int64)
    Assert.isTrue(Test.f5<Array<Rune>, Any> is () -> Unit)
    Assert.isTrue(Test.f6<Bool, Bool> is (Bool, Bool) -> Unit)
    Assert.isTrue(Test.f7<Bool> is () -> Int64)
    Assert.isTrue(Test.f8<Float64, Any> is (Float64, Int64) -> String)

    Assert.isTrue(TestG<Rune, Bool, Unit>.f1<Object> is () -> Unit)
    Assert.isTrue(TestG<Rune, Bool, Unit>.f2<Test, Test> is (Test, Test) -> Unit)
    Assert.isTrue(TestG<Rune, Bool, Unit>.f3<Float16> is () -> Int64)
    Assert.isTrue(TestG<Rune, Bool, Unit>.f4<Range<Int16>, Bool> is (Range<Int16>, Int64) -> Int64)
    Assert.isTrue(TestG<Rune, Bool, Unit>.f5<Object, Any> is () -> Unit)
    Assert.isTrue(TestG<Rune, Bool, Unit>.f6<Int64, Int64> is (Int64, Int64) -> Unit)
    Assert.isTrue(TestG<Rune, Bool, Unit>.f7<Bool> is () -> Int64)
    Assert.isTrue(TestG<Rune, Bool, Unit>.f8<Unit, Test> is (Unit, Int64) -> String)
}