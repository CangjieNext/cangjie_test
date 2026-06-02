/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a24_01

  @Level:         1

  @Assertion: 6.1.2.4(24)
              A generic static function defined in a class can be invoked
              as long as legal type arguments are provided for the generic class
              and generic static function of the class

  @Description: Check that static generic functions with legal type arguments are invoked correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Regular {
    static func f1<T>() {}
    static func f2<U>(x: U, y: U) {}
    static func f3<T>() {
        return 1
    }
    static func f4<T>(x: Int64) {
        return 2
    }

    static func f5<T>() where T <: Object {}
    static func f6<T1, T2>(x: T1) {}
    static func f7<T1, T2, T3>() {
        return 3
    }
    static func f8<T1, T2>(x: T1, y: T2) {
        return 4
    }

    // Check instantiation with concrete types
    static func test() {
        Assert.isTrue(Regular.f1<Int64>() is Unit)
        Assert.isTrue(Regular.f2<Bool>(false, true) is Unit)
        Assert.equals(1, Regular.f3<Rune>())
        Assert.equals(2, Regular.f4<String>(11))

        Assert.isTrue(Regular.f5<Object>() is Unit)
        Assert.isTrue(Regular.f6<Regular, Object>(Regular()) is Unit)
        Assert.equals(3, Regular.f7<Regular, Object, Any>())
        Assert.equals(4, Regular.f8<Rune, Bool>(r'e', false))
    }
}

class Generic<A, B> {
    static func f1<T>() {}
    static func f2<U>(x: Bool, y: Rune) {}
    static func f3<T>() {
        return 1
    }
    static func f4<T>(x: Int64) {
        return 2
    }

    static func f5<T>() {}
    static func f6<T1, T2>(x: String) {}
    static func f7<T1, T2, T3>() {
        return 3
    }
    static func f8<T1, T2>(x: String, y: String) {
        return 4
    }

    // Check instantiation with generic types
    static func test() {
        Assert.isTrue(f1<A>() is Unit)
        Assert.isTrue(f2<B>(true, r'8') is Unit)
        Assert.equals(1, f3<A>())
        Assert.equals(2, f4<B>(11))

        Assert.isTrue(f5<A>() is Unit)
        Assert.isTrue(f6<A, B>("vvvvvv") is Unit)
        Assert.equals(3, f7<A, B, Any>())
        Assert.equals(4, f8<A, A>("b", "****"))
    }
}

open class C {}
class D <: C {}

main() {
    Regular.test()
    Generic<D, C>.test()
}