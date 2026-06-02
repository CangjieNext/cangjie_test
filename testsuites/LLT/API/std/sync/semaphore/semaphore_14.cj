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
 * Test description: Test the funcs in Semaphore.cj
 * Test API:
 *   - Semaphore.init()
 *   - Semaphore.tryAcquire()
 */

internal import std.sync.Semaphore
internal import std.sync.AtomicInt64

main(): Int64 {
    let sem_1 = Semaphore(1)
    try {
        sem_1.tryAcquire(amount: -2) // Acquire negative amount
    } catch (ex: IllegalArgumentException) {
        return 0
    }
    return 1
}
