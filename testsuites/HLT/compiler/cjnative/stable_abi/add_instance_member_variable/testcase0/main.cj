/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*
import std.reflect.*

main(): Unit {
    let c = C<Int64, String, Bool>(114514, "hello", true)
    println("c: ${TypeInfo.of(c)}")
    println("c.v0: ${TypeInfo.of(c.v0)}")
    println("c.v1: ${TypeInfo.of(c.v1)}")
    println("c.v2: ${TypeInfo.of(c.v2)}")
    println("c.v3: ${TypeInfo.of(c.v3)}")
    assert(c.v3, 114514)
    println("c.v4: ${TypeInfo.of(c.v4)}")
    println("c.v5: ${TypeInfo.of(c.v5)}")
    assert(c.v5.v, 123)
    println("c.v6: ${TypeInfo.of(c.v6)}")
    assert(match (c.v6) {
        case B(a, b, c) => true
        case A => false
    }, true)
    println("c.v7: ${TypeInfo.of(c.v7)}")
    assert(match (c.v7) {
        case B(a, b, c) => true
        case A => false
    }, true)
    println("c.v8: ${TypeInfo.of(c.v8)}")
    println("c.v9: ${TypeInfo.of(c.v9)}")
    assert(c.v8.v, 456)
    println("c.v10: ${TypeInfo.of(c.v10)}")
    println("c.v11: ${TypeInfo.of(c.v11)}")
    check(c)
}
