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
                atomicRef1.store(Some(A()))
                atomicRef2.store(Some(A()))
                atomicRef3.store(Some(A()))
                atomicRef4.store(Some(A()), memoryOrder: SeqCst)
                atomicRef5.store(Some(A()), memoryOrder: SeqCst)
                atomicRef6.store(Some(A()), memoryOrder: SeqCst)
            })
    }
    for (i in 0..10) {
        arr[i].get()
    }

    atomicRef1.store(Some(A()), memoryOrder: SeqCst)
    atomicRef2.store(Some(A()), memoryOrder: SeqCst)
    atomicRef3.store(Some(A()), memoryOrder: SeqCst)
    atomicRef4.store(Some(A()))
    atomicRef5.store(Some(A()))
    atomicRef6.store(Some(A()))

    if (A.a.load() == 67 && a.b == 0 && atomicRef1.load().getOrThrow().b == 61 && atomicRef2.load().getOrThrow().b == 62 &&
        atomicRef3.load().getOrThrow().b == 63 && atomicRef4.load(memoryOrder: SeqCst).getOrThrow().b == 64 &&
        atomicRef5.load(memoryOrder: SeqCst).getOrThrow().b == 65 &&
        atomicRef6.load(memoryOrder: SeqCst).getOrThrow().b == 66) {
        return 0
    }
    return 1
}
