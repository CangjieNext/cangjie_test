/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.sync.*

class A {
    static var a = AtomicInt64(0)
    var b = 0
    init() {
        b = a.fetchAdd(1)
    }
}

var a = A()

main(): Int64 {
    let atomicRef1 = AtomicOptionReference<A>(Some(a))
    let atomicRef2 = AtomicOptionReference<A>(Some(a))
    let atomicRef3 = AtomicOptionReference<A>(Some(a))
    let atomicRef4 = AtomicOptionReference<A>(Some(a))
    let atomicRef5 = AtomicOptionReference<A>(Some(a))
    let atomicRef6 = AtomicOptionReference<A>(Some(a))
    let arr = ArrayList<Future<Unit>>()
    for (_ in 0..10) {
        arr.add(
            spawn {
                a = atomicRef1.swap(Some(A()), memoryOrder: SeqCst).getOrThrow()
                a = atomicRef2.swap(Some(A())).getOrThrow()
                a = atomicRef3.swap(Some(A()), memoryOrder: SeqCst).getOrThrow()
                a = atomicRef4.swap(Some(A())).getOrThrow()
                a = atomicRef5.swap(Some(A()), memoryOrder: SeqCst).getOrThrow()
                a = atomicRef6.swap(Some(A())).getOrThrow()
            })
    }
    for (i in 0..10) {
        arr[i].get()
    }
    a = atomicRef6.swap(Some(A()), memoryOrder: SeqCst).getOrThrow()

    if (A.a.load() != 62) {
        println("A.a.load() == ${A.a.load()}")
        return 1
    }
    if (atomicRef6.load().getOrThrow().b != 61) {
        println("atomicRef6.load().getOrThrow().b == ${atomicRef6.load().getOrThrow().b}")
        return 2
    }
    return 0
}
