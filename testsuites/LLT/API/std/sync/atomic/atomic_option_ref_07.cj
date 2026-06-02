/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

/*
 * Test description: Test the methods of AtomicOptionReference<T>
 * Test API:
 *          public init()
 *          public func load(): Option<T>
 *          public func store(val: Option<T>): Unit
 */

internal import std.sync.*

class A {
    public var val: Int64
    public init(v: Int64) {
        val = v
    }
}

main(): Int64 {
    let N = 10
    let a = A(10)
    let atomicOptRef = AtomicOptionReference<A>()

    for (i in 0..N) {
        spawn {
            atomicOptRef.store(a)
        }
    }

    return match (atomicOptRef.load()) {
        case Some(obj) =>
            if (refEq(obj, a)) {
                0
            } else {
                1
            }
        case None => 0
    }
}
