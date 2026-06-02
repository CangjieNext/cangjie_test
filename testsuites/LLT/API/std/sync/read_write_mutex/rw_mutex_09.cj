/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %f %cmp_opt -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan ok

/*
 * Test description: Test the funcs in reentrant_read_write_mutex.cj
 * Trylock of read-mutex.
 * Test API:
 *   - ReentrantReadMutex.lock()
 *   - ReentrantReadMutex.unlock()
 */

internal import std.sync.AtomicInt64
internal import std.sync.ReentrantReadWriteMutex
internal import std.collection.ArrayList

main(): Unit {
    let rwm = ReentrantReadWriteMutex()

    let fut = spawn {
        rwm.writeMutex.lock()
    }
    fut.get()
    // The thread does not release the lock

    let fut2 = spawn {
        if (rwm.readMutex.tryLock()) {
            println("error")
        } else {
            println("ok")
        }
    }
    fut2.get()
}
