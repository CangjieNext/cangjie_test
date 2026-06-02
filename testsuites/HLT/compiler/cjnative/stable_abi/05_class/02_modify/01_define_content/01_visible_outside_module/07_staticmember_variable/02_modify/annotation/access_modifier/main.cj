/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

public func assert<T>(expected: T, actual: T): Unit where T <: Equatable<T> & ToString {
    if (expected == actual) {
    } else {
        throw Exception("${expected} != ${actual}")
    }
}

main(): Unit {
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
    checker()
}
