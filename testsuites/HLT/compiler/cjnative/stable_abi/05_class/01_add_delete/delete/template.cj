/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: delete classes
public class Father1 {
    public var v1 = 0
    public mut prop v2: Int64 {
        get() {
            v1 + 1
        }
        set(value) {
            v1 = value
        }
    }
    public var v3: Int64

    public open func foo1(a: Int64) {
        10
    }

    public static func foo2(a: Int64) {
        100
    }

    public init(input: Int64) {
        this.v3 = input
    }
}

public class Generics1<T> {
    public var _v1 = 0
    public mut prop _v2: Int64 {
        get() {
            _v1 + 1
        }
        set(value) {
            _v1 = value
        }
    }
    public var _v3: Int64

    public open func goo1(a: Int64) {
        10
    }

    public static func goo2(a: Int64) {
        100
    }

    public init(input: Int64) {
        this._v3 = input
    }

    public func goo3(a: T) {
        return a
    }
}

class Father2 {
    var v1 = 0
    mut prop v2: Int64 {
        get() {
            v1 + 1
        }
        set(value) {
            v1 = value
        }
    }
    var v3: Int64

    open func foo1(a: Int64) {
        10
    }

    static func foo2(a: Int64) {
        100
    }

    init(input: Int64) {
        this.v3 = input
    }
}

class Generics2<T> {
    var _v1 = 0
    mut prop _v2: Int64 {
        get() {
            _v1 + 1
        }
        set(value) {
            _v1 = value
        }
    }
    var _v3: Int64

    open func goo1(a: Int64) {
        10
    }

    static func goo2(a: Int64) {
        100
    }

    init(input: Int64) {
        this._v3 = input
    }

    func goo3(a: T) {
        return a
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func check<T>(f1: Father1, g1: Generics1<T>, t: T): Unit where T <: Equatable<T> & ToString {
    assert(f1.v1, 0)
    assert(f1.v2, 1)
    assert(f1.v3, 5)
    assert(f1.foo1(9), 10)
    assert(Father1.foo2(90), 100)

    assert(g1._v1, 0)
    assert(g1._v2, 1)
    assert(g1._v3, 101)
    assert(g1.goo1(1), 10)
    assert(Generics1<T>.goo2(10), 100)
    assert(g1.goo3(t), t)
}
