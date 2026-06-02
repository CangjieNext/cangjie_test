/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-0: %compiler %cmp_opt %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan 21

/*
 * Test description: Test the funcs in monitor.cj and simple_buffer.cj
 * Test API:
 *          public class Monitor <: ReentrantMutex
 *               public func notify(): Unit
 *          class SimpleBufferBlock<T>
 *              func concateNextBlock(block: SimpleBufferBlock<T>)
 *          class SimpleBuffer<T>
 *              func append(v: T)
 */

internal import std.sync.*
internal import std.runtime.*

func testMonitor() {
    let m = Monitor()
    spawn {
        m.lock()
        m.wait()
        print(1)
        m.unlock()
    }
    sleep(Duration.second)
    m.lock()
    m.notify()
    print(2)
    m.unlock()
}

func testSimpleBuff() {
    var m = MultiConditionMonitor()
    for (i in 0..9) {
        m.lock()
        m.newCondition()
        m.unlock()
    }
}

main() {
    testMonitor()
    testSimpleBuff()
    GC()
    sleep(Duration.second)
    return 0
}
