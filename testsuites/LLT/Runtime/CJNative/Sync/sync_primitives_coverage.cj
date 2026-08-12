// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime sync primitives pass

import std.runtime.*
import std.sync.*

func waitUntil(value: AtomicInt64, expected: Int64): Bool {
    for (_ in 0..10000) {
        if (value.load() == expected) {
            return true
        }
        sleep(100 * Duration.microsecond)
    }
    return false
}

func waitForGCCountIncrease(previous: Int64): Bool {
    for (_ in 0..10000) {
        if (getGCCount() > previous) {
            return true
        }
        sleep(100 * Duration.microsecond)
    }
    return false
}

func testMutex(): Bool {
    let mutex = Mutex()
    mutex.lock()
    mutex.lock()
    if (!mutex.tryLock()) {
        return false
    }

    let attempted = AtomicInt64(0)
    let contender = spawn { =>
        let locked = mutex.tryLock()
        if (locked) {
            mutex.unlock()
        }
        attempted.store(1)
        locked
    }
    if (!waitUntil(attempted, 1)) {
        return false
    }
    mutex.unlock()
    mutex.unlock()
    mutex.unlock()
    return !contender.get()
}

func testCondition(): Bool {
    let mutex = Mutex()
    mutex.lock()
    let condition = mutex.condition()
    if (condition.wait(timeout: Duration.millisecond)) {
        mutex.unlock()
        return false
    }
    mutex.unlock()

    let ready = AtomicInt64(0)
    let notified = spawn { =>
        mutex.lock()
        ready.store(1)
        let result = condition.wait(timeout: 2 * Duration.second)
        mutex.unlock()
        result
    }
    if (!waitUntil(ready, 1)) {
        return false
    }
    mutex.lock()
    condition.notify()
    mutex.unlock()
    if (!notified.get()) {
        return false
    }

    let allReady = AtomicInt64(0)
    let waiter1 = spawn { =>
        mutex.lock()
        allReady.fetchAdd(1)
        let result = condition.wait(timeout: 2 * Duration.second)
        mutex.unlock()
        result
    }
    let waiter2 = spawn { =>
        mutex.lock()
        allReady.fetchAdd(1)
        let result = condition.wait(timeout: 2 * Duration.second)
        mutex.unlock()
        result
    }
    if (!waitUntil(allReady, 2)) {
        return false
    }
    mutex.lock()
    condition.notifyAll()
    mutex.unlock()
    return waiter1.get() && waiter2.get()
}

func testMultiConditionMonitor(): Bool {
    let monitor = MultiConditionMonitor()
    monitor.lock()
    let first = monitor.newCondition()
    let second = monitor.newCondition()
    if (monitor.wait(first, timeout: Duration.millisecond)) {
        monitor.unlock()
        return false
    }
    monitor.unlock()

    let ready = AtomicInt64(0)
    let firstWaiter = spawn { =>
        monitor.lock()
        ready.fetchAdd(1)
        let result = monitor.wait(first, timeout: 2 * Duration.second)
        monitor.unlock()
        result
    }
    let secondWaiter1 = spawn { =>
        monitor.lock()
        ready.fetchAdd(1)
        let result = monitor.wait(second, timeout: 2 * Duration.second)
        monitor.unlock()
        result
    }
    let secondWaiter2 = spawn { =>
        monitor.lock()
        ready.fetchAdd(1)
        let result = monitor.wait(second, timeout: 2 * Duration.second)
        monitor.unlock()
        result
    }
    if (!waitUntil(ready, 3)) {
        return false
    }
    monitor.lock()
    monitor.notify(first)
    monitor.notifyAll(second)
    monitor.unlock()
    return firstWaiter.get() && secondWaiter1.get() && secondWaiter2.get()
}

main(): Int64 {
    if (!testMutex()) {
        return 1
    }
    if (!testCondition()) {
        return 2
    }
    if (!testMultiConditionMonitor()) {
        return 3
    }

    for (_ in 0..8) {
        let previousGCCount = getGCCount()
        gc(heavy: true)
        if (!waitForGCCountIncrease(previousGCCount)) {
            return 4
        }
    }
    println("runtime sync primitives pass")
    return 0
}
