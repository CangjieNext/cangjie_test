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
    var b = AtomicInt64(0)
    init() {
        a.fetchAdd(1)
    }
    func test() {
        this.b.fetchAdd(1)
    }
}

var a = A()

main(): Int64 {
    let atomicRef = AtomicOptionReference<A>(Some(a))
    let arr = ArrayList<Future<Unit>>()
    for (_ in 0..10) {
        arr.add(spawn {
            atomicRef.load().getOrThrow().test()
        })
    }
    for (i in 0..10) {
        arr[i].get()
    }
    if (A.a.load() == 1 && a.b.load() == 10) {
        return 0
    }
    return 1
}
