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
 * Test description: Test the funcs in reentrant_read_write_mutex.cj
 * Write-mutex downgrades.
 * Test API:
 *   - ReentrantReadMutex.lock()
 *   - ReentrantReadMutex.unlock()
 */

internal import std.sync.AtomicInt64
internal import std.sync.ReentrantReadWriteMutex
internal import std.collection.ArrayList

main(): Unit {
    let futs = ArrayList<Future<Unit>>()
    let rwm = ReentrantReadWriteMutex()
    let counter = AtomicInt64(0)

    let fut = spawn {
        rwm.writeMutex.lock() // Hold write-mutex
        rwm.readMutex.lock() // Hold read-mutex
        sleep(Duration.microsecond * 100)
        rwm.writeMutex.unlock() // Downgrade mutex; it does not release read-mutex
    }
    fut.get()
    // The thread does not release the lock

    for (_ in 0..5) {
        let f = spawn {
            synchronized(rwm.readMutex) {
                for (_ in 0..10) {
                    counter.fetchAdd(1)
                    sleep(Duration.microsecond * 100)
                }
                // Busy waiting
                while (counter.load() != 50) {}
            }
        }
        futs.add(f)
    }
}
