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
 * Using multiple mutexs at the same time
 * Test API:
 *   - ReentrantReadMutex.lock()
 *   - ReentrantReadMutex.unlock()
 */

internal import std.sync.*

main(): Int64 {
    let mutexArr = Array<ReentrantReadWriteMutex>(100, {i: Int64 => ReentrantReadWriteMutex()})
    for (rwm in mutexArr) {
        synchronized(rwm.readMutex) {}
    }
    0
}
