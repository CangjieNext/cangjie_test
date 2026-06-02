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
    let newObj = A()
    for (_ in 0..10) {
        arr.add(
            spawn {
                atomicRef1.compareAndSwap(Some(a), Some(A()))
                atomicRef2.compareAndSwap(Some(a), Some(A()))
                atomicRef3.compareAndSwap(Some(a), Some(A()), successOrder: SeqCst, failureOrder: SeqCst)
                atomicRef4.compareAndSwap(Some(a), Some(A()), successOrder: SeqCst, failureOrder: SeqCst)
                atomicRef5.compareAndSwap(Some(a), Some(A()), successOrder: SeqCst, failureOrder: SeqCst)
                atomicRef6.compareAndSwap(Some(a), newObj, successOrder: SeqCst, failureOrder: SeqCst)
            })
    }
    for (i in 0..10) {
        arr[i].get()
    }
    if (A.a.load() == 52 && a.b == 0 && atomicRef6.load().getOrThrow().b == 1) {
        return 0
    }
    return 1
}
