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
 * Read-unlock exception.
 * Test API:
 *   - ReentrantReadMutex.lock()
 *   - ReentrantReadMutex.unlock()
 */

internal import std.sync.{ReentrantReadWriteMutex, IllegalSynchronizationStateException}

main(): Unit {
    let rwm = ReentrantReadWriteMutex()

    let fut = spawn {
        try {
            rwm.readMutex.unlock()
        } catch (ex: IllegalSynchronizationStateException) {
            println("ok")
        }
    }
    fut.get()
}
