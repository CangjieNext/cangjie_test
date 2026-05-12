/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: staticmember function
public open class Father {}

public class Son <: Father {}

public class TestClass {
    public let check = 0

    public static func f1() {
        1
    }

    protected static func f2() {
        2
    }

    static const func f3(): Int64 {
        return 3
    }
    public static const func f4(): Int64 {
        f3()
    }

    static func f5(): Int64 {
        return 5
    }

    @Frozen
    public static func f6(): Int64 {
        f5()
    }

    public func add1(a: Int64, b: Int64): Int64 {
        return a + b
    }

    protected func add2(a: Int64, b: Int64): Int64 {
        return a + b
    }

    public func add3(a!: Int64, b!: Int64): Int64 {
        return a + b
    }

    protected func add4(a!: Int64, b!: Int64): Int64 {
        return a + b
    }

    static const func f7(): Int64 {
        return 7
    }
    public static const func f8(b!: Int64 = 1): Int64 {
        f7() + b
    }

    static func f9(): Int64 {
        return 9
    }

    @Frozen
    public static func f10(b!: Int64 = 1): Int64 {
        f9() + b
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    assert(TestClass.f1(), 1)
    assert(TestClass.f2(), 2)
    assert(TestClass.f3(), 3)
    assert(TestClass.f4(), 3)
    assert(TestClass.f5(), 5)
    assert(TestClass.f6(), 5)
    assert(TestClass.f7(), 7)
    assert(TestClass.f8(), 8)
    assert(TestClass.f9(), 9)
    assert(TestClass.f10(), 10)
}
