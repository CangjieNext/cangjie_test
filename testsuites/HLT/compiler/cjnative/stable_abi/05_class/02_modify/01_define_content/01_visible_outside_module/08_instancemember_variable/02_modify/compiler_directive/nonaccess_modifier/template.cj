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
public open class Father {}

public class Son <: Father {}

public class CC {
    public static let c1: Father = Son()

    protected var a1 = 1
    protected let a2 = 2
    protected let a3 = 3

    @Deprecated["this var is deprecated", strict: false]
    protected let b1 = 1

    @Deprecated["this var is deprecated", strict: true]
    protected var b2 = 2

    @Frozen
    public func f1() {
        a1
    }

    @Frozen
    public func f2() {
        a2
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    let c = CC()
    assert(CC.c1 is Son, true)
    assert(c.a1, 1)
    assert(c.a2, 2)
    assert(c.a3, 3)
    assert(c.b1, 1)
    assert(c.f1(), 1)
    assert(c.f2(), 2)
}
