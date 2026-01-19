/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: staticmember variable
public open class Father {
    const init() {}
}

public class Son <: Father {
    const init() {}
}

public class CC {
    private let a1: Int8 = 1
    private var a2: Int32 = 2

    internal let c1: Int8 = 1
    internal var c2: Int32 = 2
}

open class baseClass {
    private let a1: Int8 = 1
    private var a2: Int32 = 2

    internal let c1: Int8 = 1
    internal var c2: Int32 = 2
}

public class B <: baseClass {
    let b: Int64 = 20
}

class privateClass {
    private let a1: Int8 = 1
    private var a2: Int32 = 2

    internal let c1: Int8 = 1
    internal var c2: Int32 = 2
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(c: CC, b: B): Unit {
    assert(c.c1, 1)
    assert(c.c2, 2)
    assert(b.c1, 1)
    assert(b.c2, 2)
    assert(b.b, 20)
}
