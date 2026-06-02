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
 *          public func compareAndSwap(old: Option<T>, new: Option<T>): Option<T>
 */

internal import std.sync.*

class A {
    public var val: Int64
    public init(v: Int64) {
        val = v
    }
}

main(): Int64 {
    let a = A(10)
    let b = A(20)
    let atomicOptRef = AtomicOptionReference<A>()

    if (!atomicOptRef.compareAndSwap(None, Some(a))) {
        return 1
    }
    if (atomicOptRef.compareAndSwap(None, Some(A(10)))) {
        return 2
    }

    if (let Some(ref) <- atomicOptRef.load()) {
        if (ref.val != 10) {
            return 3
        }
    } else {
        return 4
    }

    if (!atomicOptRef.compareAndSwap(Some(a), Some(b))) {
        return 5
    }
    if (atomicOptRef.compareAndSwap(Some(a), Some(b))) {
        return 6
    }

    return match (atomicOptRef.load()) {
        case Some(ref) =>
            if (ref.val == 20) {
                0
            } else {
                7
            }
        case None => 8
    }
}
