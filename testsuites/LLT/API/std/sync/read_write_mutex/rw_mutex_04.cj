/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %f %cmp_opt -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan-not error

/*
 * Test description: Test the funcs in reentrant_read_write_mutex.cj
 * Under fair mode: reader A -> writer B -> reader C,
 *                  the reader C will not acquire the read-mutex.
 * Test API:
 *   - ReentrantWriteMutex.lock()
 *   - ReentrantWriteMutex.unlock()
 */

internal import std.sync.AtomicInt64
internal import std.sync.{ReentrantReadWriteMutex, ReadWriteMutexMode}
internal import std.collection.ArrayList

let num1 = AtomicInt64(0)
let num2 = AtomicInt64(0)

// Assume `num1` and `num2` are always assigned together
func transaction(n: Int64): Unit {
    num1.fetchAdd(n)
    sleep(Duration.microsecond * 10)
    num2.fetchAdd(-n)

    if (num1.load() + num2.load() != 0) {
        println("error")
    }
}

main(): Unit {
    let futs = ArrayList<Future<Unit>>()
    let rwm = ReentrantReadWriteMutex(mode: ReadWriteMutexMode.Fair)

    let fut1 = spawn {
        rwm.readMutex.lock()
    }
    fut1.get()
    // The first thread does not release the read mutex

    // The second thread try to acquire the write mutex
    let fut2 = spawn {
        synchronized(rwm.writeMutex) {
        }
    }

    // The third thread cannot acquire the read mutex
    let fut3 = spawn {
        sleep(Duration.second * 3)
        rwm.readMutex.lock()
        println("error")
    }
    sleep(Duration.second * 5)
}
