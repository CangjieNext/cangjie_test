/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

/*
 * Test description: Test the funcs of ReentrantMutex
 * Test API:
 *          public func tryLock()
 *          func checkMutexStatus(): Unit
 *
 */
internal import std.sync.*

main(): Int64 {
    let rm = ReentrantMutex()
    try {
        rm.unlock()
        return 1
    } catch (e: IllegalSynchronizationStateException) {}

    if (!rm.tryLock()) {
        return 2
    }
    return 0
}
