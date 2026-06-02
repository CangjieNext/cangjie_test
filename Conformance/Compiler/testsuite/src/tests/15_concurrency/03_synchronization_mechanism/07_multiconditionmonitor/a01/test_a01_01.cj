/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_07_a01_01

  @Level:         1
  @Assertion:    15.3.7(1) MultiConditionMonitor is a built-in implementation
                 of a data structure that combines a mutex with a set of
                 dynamically created condition instances associated with this
                 mutex.
                 This class should only be used for implementing advanced
                 concurrent algorithms when the Monitor API is not enough.

  @Description:  Checks that MultiConditionMonitor acts as Mutex and thread
                 can wait on monitor and can be notified

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert
import thread_commons.*

var threadStarted:Bool = false


main(): Int64 {
    let m = Mutex()
    let condId:Condition
    synchronized(m) {
        condId = m.condition()
    }

    // checking MultiConditionMonitor is mutex
    Assert.isTrue(m is Lock,
            reason: "MultiConditionMonitor is ReentrantMutex")

    // checking MultiConditionMonitor is NOT Monitor
    Assert.isTrue(m is UniqueLock,
            reason: "MultiConditionMonitor is NOT Monitor")

    // checking thread lock
    let fut = spawn {
        threadStarted = true
        let (_, time) = measure({ =>
            synchronized(m) {
                Assert.isTrue(condId.wait(timeout: Duration.nanosecond * LONG_TIMEOUT) is Bool)
            }
        })
        Assert.isTrue(time < LONG_TIMEOUT)
        return 0xA
    }
    while (!threadStarted) {
        sleep(Duration.nanosecond * 10) // waiting for the thread
    }
    sleep(Duration.nanosecond * 100_000) // sleep some reasonable amount of time
    Assert.isTrue(m.tryLock(), reason: "Mutex shouldn't be locked")
    m.unlock()
    synchronized(m) {
        Assert.isTrue(condId.notify() is Unit)
    }
    // checking thread result
    Assert.equals(0xA, fut.get(), reason: "Thread should be terminated")
    return 0
}
