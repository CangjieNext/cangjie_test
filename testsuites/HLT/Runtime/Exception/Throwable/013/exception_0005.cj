/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %export cjHeapSize=16MB && %export JETVMPROP=-Xmx16M && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan OutOfMemoryError

import std.collection.*
import std.sync.*
import std.time.*
import std.runtime.*

let mtx = ReentrantMutex()

class A {
    let x1 = 42
    let x2 = 42
    let x3 = 42
    let x4 = 42
    let x5 = 42
}

main(): Int64 {
    let res1 = spawn {
        mtx.lock()
        var list = ArrayList<A>()
        try {
            while (true) {
                list.add(A())
            }
        } catch (_: OutOfMemoryError) {
            list.clear()
            GC()
            println("OutOfMemoryError")
        }
    }
    res1.get()
    let res2 = spawn {
        if (mtx.tryLock()) {
            return 0
        }
        return 1
    }
    if (res2.get() == 0) {
        return 1
    }
    return 0
}
