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

@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

public class CC {
    public static let a1 = 1
    public static var a2 = 2

    @Version["1.1"]
    public static let f1 = 1
    @Version["1.1"]
    public static var f2 = 2
}

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

public func checker(): Unit {
    assert(CC.a1, 1)
    assert(CC.a2, 2)
    CC.a2 = 3
    assert(CC.a2, 3)
    CC.a2 = 2
    assert(CC.a2, 2)
    assert(CC.f1, 1)
    assert(CC.f2, 2)
    CC.f2 = 3
    assert(CC.f2, 3)
    CC.f2 = 2
    assert(CC.f2, 2)
}
