/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %f %cmp_opt -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

/*
 * Test description: Test the funcs in Barrier.cj
 * Test API:
 *   - Barrier.init()
 *   - Barrier.wait()
 * Large-scale testing.
 */

internal import std.sync.Barrier
internal import std.sync.SyncCounter
internal import std.sync.AtomicInt64

main(): Int64 {
    let N = 1000
    let counter = AtomicInt64(0)
    let sum = AtomicInt64(0)
    let barrier = Barrier(N)
    let syncCounter = SyncCounter(N)

    for (i in 0..N) {
        spawn {
            counter.fetchAdd(1)
            barrier.wait()
            sum.fetchAdd(counter.load()) // Each thread reads counter as `N`
            syncCounter.dec()
        }
    }
    syncCounter.waitUntilZero() // Wait all threads

    if (sum.load() == N * N) {
        return 0
    } else {
        return 1
    }
}
