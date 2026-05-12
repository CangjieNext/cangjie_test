/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: instancemember variable

public open class CC {
    public let check = 0

    public let a1 = 1
    public var a2 = 2

    protected let c1 = 1
    protected var c2 = 2

    internal let b1 = 1
    internal var b2 = 2

    private let d1 = 1
    private var d2 = 2
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    let c = CC()
    assert(c.check, 0)
    assert(c.a1, 1)
    assert(c.a2, 2)
    c.a2 = 22
    assert(c.a2, 22)
    c.a2 = 2
    assert(c.a2, 2)
    assert(c.c1, 1)
    assert(c.c2, 2)
    c.c2 = 22
    assert(c.c2, 22)
    c.c2 = 2
    assert(c.c2, 2)
    assert(c.b1, 1)
    assert(c.b2, 2)
    c.b2 = 22
    assert(c.b2, 22)
    c.b2 = 2
    assert(c.b2, 2)
}
