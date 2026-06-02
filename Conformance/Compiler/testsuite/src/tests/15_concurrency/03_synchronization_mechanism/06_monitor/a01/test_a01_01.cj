/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_06_a01_01

  @Level:         1
  @Assertion:    15.3.6(1) Monitor is a built-in implementation of a data
                 structure that combines a mutex with a single associated
                 condition (a.k.a. wait queue). Monitor enables a thread to
                 block and wait for a signal from another thread to resume
                 execution. It is a mechanism for synchronizing threads using
                 variables shared between them.

  @Description:  Checks that Monitor acts as Mutex and thread can wait on
                 monitor and can be notified

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
    let c = synchronized(m) { m.condition() }
    // checking monitor is mutex
    Assert.isTrue(m.lock() is Unit, reason: "lock() method should be available")
    Assert.isTrue(m.tryLock(), reason: "tryLock() method should be available")
    m.unlock()
    Assert.isTrue(m.unlock() is Unit, reason: "unlock() method should be available")

    // checking thread lock
    let fut = spawn {
        threadStarted = true
        let (_, time) = measure({ =>
            synchronized(m) {
                Assert.isTrue(c.wait(timeout: Duration.nanosecond * LONG_TIMEOUT) is Bool)
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
        Assert.isTrue(c.notify() is Unit)
    }
    // checking thread result
    Assert.equals(0xA, fut.get(), reason: "Thread should be terminated")
    return 0
}
