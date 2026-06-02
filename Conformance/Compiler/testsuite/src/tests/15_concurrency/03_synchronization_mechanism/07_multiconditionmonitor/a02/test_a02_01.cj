/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_07_a02_01

  @Level:         1
  @Assertion:    15.3.7(2) Provides the following methods:
    • newCondition(): ConditionID:  Create, associate a new wait queue with
            this monitor and returns a unique Condition identifier.
    • wait(id: ConditionID, timeout!: Duration.Max): Bool:  Wait
            for a signal, blocking the current thread.
    • notify(id: ConditionID): Unit:  Wake up one thread of those waiting on
            the monitor, if any.
    • notifyAll(id: ConditionID): Unit:  Wake up all threads waiting on the
            monitor, if any.

  @Description:  Checks that MultiConditionMonitor provides all its methods

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
var waitUnlocked:Bool = false

main(): Int64 {
    let m = Mutex()
    let condId:Condition
    synchronized(m) {
        // checking 1M of ConditionIDs can be generated
        for (i in 0..1_000_000) {
            Assert.isTrue(m.condition() is Condition)
        }
        condId = m.condition()
    }

    // checking thread lock
    let fut = spawn {
        threadStarted = true
        let (_, time1) = measure({ =>
            synchronized(m) {
                Assert.isTrue(condId.wait(timeout: Duration.nanosecond * LONG_TIMEOUT) is Bool,
                    reason: "Checking wait return type")
            }
        })

        waitUnlocked = true
        Assert.isTrue(time1 < LONG_TIMEOUT)
        let (_, time2) = measure({ =>
            synchronized(m) {
                condId.wait()
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
        Assert.isTrue(condId.notify() is Unit,
            reason: "Checking notify return type")
    }

    while (!waitUnlocked) {
        sleep(Duration.nanosecond * 10) // waiting for the first block
    }
    let fut2 = spawn {
        let (_, time2) = measure({ =>
            synchronized(m) {
                condId.wait()
            }
        })
        Assert.isTrue(time2 < LONG_TIMEOUT)
        return 0xB
    }

    sleep(Duration.nanosecond * 100_000) // sleep some reasonable amount of time
    Assert.isTrue(m.tryLock(), reason: "Mutex shouldn't be locked")
    m.unlock()
    synchronized(m) {
        Assert.isTrue(condId.notifyAll() is Unit,
            reason: "Checking notifyAll return type")
    }
    // checking thread result
    Assert.equals(0xA, fut.get(), reason: "Thread should be terminated")
    Assert.equals(0xB, fut2.get(), reason: "Thread2 should be terminated")
    return 0
}
