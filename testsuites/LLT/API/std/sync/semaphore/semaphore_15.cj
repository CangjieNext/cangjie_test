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
 *   - Semaphore.acquire()
 *   - Semaphore.release()
 *   - Semaphore.count
 */

internal import std.sync.Semaphore
internal import std.sync.AtomicInt64

main(): Int64 {
    let sem_1 = Semaphore(50)
    sem_1.acquire(amount: 50)
    sem_1.release(amount: 50)
    if (sem_1.count == 50) {
        return 0
    } else {
        return 1
    }
}
