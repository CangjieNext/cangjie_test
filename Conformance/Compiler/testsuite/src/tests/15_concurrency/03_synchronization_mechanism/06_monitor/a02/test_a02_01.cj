/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_06_a02_01

  @Level:         1
  @Assertion:    15.3.6(2) A Monitor provides the following methods:
    • wait(timeout!: Duration = Duration.Max): Bool:  Wait for a signal,
                        blocking the current thread.
    • notify(): Unit:  Wake up one thread of those waiting on the monitor, if any.
    • notifyAll(): Unit:  Wake up all threads waiting on the monitor, if any.

  @Description:  Checks that Monitor provides required methods

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

  @Issue:        0006629

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert
import thread_commons.*

var threadStarted:Bool = false
var waitUnlocked1:Bool = false

main(): Int64 {
    let m = Mutex()
    let c = synchronized(m) { m.condition() }

    // checking thread lock
    let fut = spawn {
        threadStarted = true
        let (_, time1) = measure({ =>
            synchronized(m) {
                Assert.isTrue(c.wait(timeout: Duration.nanosecond *LONG_TIMEOUT) is Bool,
                    reason: "Checking wait return type")
            }
        })

        waitUnlocked1 = true
        Assert.isTrue(time1 < LONG_TIMEOUT)
        let (_, time2) = measure({ =>
            synchronized(m) {
                c.wait()
            }
        })
        Assert.isTrue(time2 < LONG_TIMEOUT)
        return 0xA
    }
    while (!threadStarted) {
        sleep(Duration.nanosecond * 10) // waiting for the thread
    }
    sleep(Duration.nanosecond * 100_000) // sleep some reasonable amount of time
    Assert.isTrue(m.tryLock(), reason: "Mutex shouldn't be locked")
    m.unlock()
    synchronized(m) {
        Assert.isTrue(c.notify() is Unit,
            reason: "Checking notify return type")
    }

    while (!waitUnlocked1) {
        sleep(Duration.nanosecond * 10) // waiting for the first block
    }
    let fut2 = spawn {
        let (_, time2) = measure({ =>
            synchronized(m) {
                c.wait()
            }
        })
        Assert.isTrue(time2 < LONG_TIMEOUT)
        return 0xB
    }

    sleep(Duration.nanosecond * 100_000) // sleep some reasonable amount of time
    Assert.isTrue(m.tryLock(), reason: "Mutex shouldn't be locked")
    m.unlock()
    synchronized(m) {
        Assert.isTrue(c.notifyAll() is Unit,
            reason: "Checking notifyAll return type")
    }
    // checking thread result
    Assert.equals(0xA, fut.get(), reason: "Thread should be terminated")
    Assert.equals(0xB, fut2.get(), reason: "Thread2 should be terminated")
    return 0
}

