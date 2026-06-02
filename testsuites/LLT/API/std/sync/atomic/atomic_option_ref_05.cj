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
 *          public init(val: Option<T>)
 *          public func load(): Option<T>
 *          public func swap(val: Option<T>): Option<T>
 */

internal import std.sync.*

class A {
    public var val: Int64
    public init(v: Int64) {
        val = v
    }
}

main(): Int64 {
    let atomicOptRef = AtomicOptionReference<A>(Some(A(100)))
    let b = atomicOptRef.swap(None)
    return match ((atomicOptRef.load(), b)) {
        case (None, Some(ref)) =>
            if (ref.val == 100) {
                0
            } else {
                1
            }
        case (_, _) => 2
    }
}
