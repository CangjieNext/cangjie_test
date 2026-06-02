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
 */

internal import std.sync.Barrier
internal import std.sync.AtomicInt64

main(): Int64 {
    let N = 0
    let barrier = Barrier(N) // Initialize with zero

    barrier.wait() // Never wait

    return 0
}
