/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:%compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: scan OK

/*
 * Test description: Test the funcs in monitor.cj
 * Test API:
 *          public class Monitor <: ReentrantMutex
 *              ~init()
 *          public class MultiConditionMonitor <: ReentrantMutex
 *              public func wait(condID: ConditionID, timeout!: Duration = Duration.Max): Bool
 *              public func notify(condID: ConditionID): Unit
 *              public func notifyAll(condID: ConditionID): Unit
 *
 */

internal import std.sync.*
internal import std.math.*
internal import std.runtime.*

func testMonitor() {
    let m = Monitor()
}

func testMultiConditionMonitor() {
    let m = MultiConditionMonitor()
    m.lock()
    let conditionID = m.newCondition()
    m.unlock()
    let fut1: Future<Unit> = spawn {
        m.lock()
        println("t1 to wait")
        m.wait(conditionID)
        println("t1 to notify")
        m.unlock()
    }
    sleep(Duration.second * 1) // Sleep 1s to ensure t1 has been waited

    let fut2: Future<Unit> = spawn {
        m.lock()
        println("t2 to wait")
        m.wait(conditionID)
        println("t2 to notify")
        m.unlock()
    }
    sleep(Duration.second * 1) // Sleep 1s to ensure t2 has been waited

    m.lock()
    m.notify(conditionID)
    m.unlock()
    sleep(Duration.second * 1)

    m.lock()
    m.notifyAll(conditionID)
    m.unlock()
    sleep(Duration.second * 1)
}

func testMCMExcption() {
    let m = MultiConditionMonitor()
    m.lock()
    let conditionID = m.newCondition()
    m.unlock()

    let m1 = MultiConditionMonitor()
    m1.lock()
    let conditionID1 = m1.newCondition()
    m1.unlock()

    try {
        m.wait(conditionID1)
    } catch (e: IllegalSynchronizationStateException) {}

    try {
        m.notify(conditionID1)
    } catch (e: IllegalSynchronizationStateException) {}

    try {
        m.notifyAll(conditionID1)
    } catch (e: IllegalSynchronizationStateException) {}
}

main() {
    testMonitor()
    testMultiConditionMonitor()
    testMCMExcption()
    GC()
    sleep(Duration.second)
    print("OK")
}
