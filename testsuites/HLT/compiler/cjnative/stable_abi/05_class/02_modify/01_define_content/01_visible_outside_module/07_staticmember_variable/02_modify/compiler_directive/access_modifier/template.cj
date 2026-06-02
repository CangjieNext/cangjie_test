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
    public static let a1 = 1
    public static var a2 = 2
    public static const a3 = 3
    public static let a4 = a1
    public static var a5 = a2
    public static const a6 = a3

    @Deprecated["this var is deprecated", strict: false]
    public static let b1 = 1

    @Deprecated["this var is deprecated", strict: false]
    public static var b2 = 2

    @Deprecated["this var is deprecated", strict: false]
    public static const b3 = 3

    @Deprecated["this var is deprecated", strict: true]
    public static let b4 = b1

    @Deprecated["this var is deprecated", strict: true]
    public static var b5 = b2

    @Deprecated["this var is deprecated", strict: true]
    public static const b6 = b3

    public static let c1: Father = Son()

    static const d1 = 1
    public static const d2 = d1

    static const e1 = 1
    static let e2 = 2
    public static const func e3() {
        e1
    }

    @Frozen
    public func e4() {
        e2
    }
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    let c0 = CC()
    assert(CC.a1, 1)
    assert(CC.a2, 2)
    CC.a2 = 22
    assert(CC.a2, 22)
    CC.a2 = 2
    assert(CC.a2, 2)
    assert(CC.a3, 3)
    assert(CC.a4, 1)
    assert(CC.a5, 2)
    CC.a5 = 22
    assert(CC.a5, 22)
    CC.a5 = 2
    assert(CC.a5, 2)
    assert(CC.a6, 3)

    assert(CC.b1, 1)
    assert(CC.b2, 2)
    CC.b2 = 22
    assert(CC.b2, 22)
    CC.b2 = 2
    assert(CC.b2, 2)
    assert(CC.b3, 3)

    assert(CC.c1 is Son, true)
    assert(CC.d1, 1)
    assert(CC.d2, 1)
    assert(CC.e1, 1)
    assert(CC.e2, 2)
    assert(CC.e3(), 1)
    assert(c0.e4(), 2)
}
