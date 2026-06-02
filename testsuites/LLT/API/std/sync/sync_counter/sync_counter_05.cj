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
 * Test description: Test the funcs in SyncCounter.cj
 * Test API:
 *   - SyncCounter.init()
 *   - SyncCounter.dec()
 *   - SyncCounter.waitUntilZero()
 */

internal import std.sync.SyncCounter
internal import std.sync.AtomicInt64

main(): Int64 {
    let N = 50
    let sum = AtomicInt64(0)
    let syncCounter = SyncCounter(N + 1) // Initialize with an extra count

    for (i in 0..N) {
        spawn {
            sum.fetchAdd(1)
            syncCounter.dec()
        }
    }
    syncCounter.waitUntilZero(timeout: Duration.millisecond) // wait for 1ms
    return 0
}
