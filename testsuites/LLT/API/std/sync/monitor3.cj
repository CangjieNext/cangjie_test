/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %n.%suffix
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %n.%suffix

/*
 * Test description: Test the funcs in monitor.cj
 * Test API:
 *          public class Monitor <: ReentrantMutex
 *               func checkTimeout(timeout: UInt64): Unit
 */

internal import std.sync.*
internal import std.runtime.*
internal import std.math.*

main() {
    let m = Monitor()
    m.lock()
    try {
        m.wait(timeout: Duration.nanosecond * Int64(UInt64.Max))
        m.unlock()
        GC()
        sleep(Duration.second)
        return 1
    } catch (e: Exception) {
        m.unlock()
    }
    GC()
    sleep(Duration.second)
    return 0
}
