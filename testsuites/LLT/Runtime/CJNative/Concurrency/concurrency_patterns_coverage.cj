// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime concurrency patterns pass

import std.sync.*
import std.runtime.*
import std.collection.*

func testBasicSpawn(): Bool {
    let fut = spawn { => 42 }
    fut.get() == 42
}

func testMultipleSpawns(): Bool {
    let f1 = spawn { => 10 }
    let f2 = spawn { => 20 }
    let f3 = spawn { => 30 }
    f1.get() + f2.get() + f3.get() == 60
}

func testSpawnWithCapture(): Bool {
    let base = 100
    let fut = spawn { => base + 1 }
    fut.get() == 101
}

func testAtomicOperations(): Bool {
    let a = AtomicInt64(0)
    a.store(42)
    let val = a.load()
    val == 42
}

func testAtomicFetchAdd(): Bool {
    let a = AtomicInt64(10)
    let old = a.fetchAdd(5)
    let now = a.load()
    old == 10 && now == 15
}

func testAtomicMultiple(): Bool {
    let a = AtomicInt64(0)
    let workers = ArrayList<Future<Int64>>()
    for (_ in 0..10) {
        let f = spawn { =>
            var local: Int64 = 0
            for (_ in 0..100) {
                a.fetchAdd(1)
                local += a.load()
            }
            local
        }
        workers.add(f)
    }
    for (w in workers) {
        blackBox(w.get())
    }
    a.load() == 1000
}

main(): Int64 {
    if (!testBasicSpawn()) {
        return 1
    }
    if (!testMultipleSpawns()) {
        return 2
    }
    if (!testSpawnWithCapture()) {
        return 3
    }
    if (!testAtomicOperations()) {
        return 4
    }
    if (!testAtomicFetchAdd()) {
        return 5
    }
    if (!testAtomicMultiple()) {
        return 6
    }
    println("runtime concurrency patterns pass")
    0
}
