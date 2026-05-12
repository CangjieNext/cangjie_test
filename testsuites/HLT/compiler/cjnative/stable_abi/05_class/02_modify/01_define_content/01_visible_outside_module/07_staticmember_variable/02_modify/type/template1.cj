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
    public static let a1: Int64 = 1
    public static var a2: Int64 = 2
    public static const a3: Int64 = 3

    public static let c1: Father = Father()
    protected static let c2: Father = Father()
    internal static const c3: Int64 = 1
    private static var c4: Int64 = 1
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    let c = CC()
    assert(CC.a1, 1)
    assert(CC.a2, 2)
    assert(CC.a3, 3)
    assert(CC.c1 is Father, true)
    assert(CC.c2 is Father, true)
    assert(CC.c3, 1)
}
