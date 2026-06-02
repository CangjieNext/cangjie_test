/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_06_a07_01

  @Level:         1
  @Assertion:    15.3.6(7) Monitor is defined as follows:
    class Monitor <: ReentrantMutex {
        // Constructor.
        init()

        // Blocks until either a paired `notify` is invoked or `timeout`
        // toNanoseconds pass.
        // Returns `true` if the monitor was signalled by another thread or
        // `false` on timeout. Spurious wakeups are allowed.
        // Throws ISSE("Mutex is not locked by the current thread") if the
        // current thread does not hold this mutex.
        func wait(timeout!:Duration = Duration.Max): Bool

        // Wakes up a single thread waiting on this monitor, if any (no
        // particular admission policy implied).
        // Throws ISSE("Mutex is not locked by the current thread") if the
        // current thread does not hold this mutex.
        func notify(): Unit

        // Wakes up all threads waiting on this monitor, if any (no particular
        // admission policy implied).
        // Throws ISSE("Mutex is not locked by the current thread") if the
        // current thread does not hold this mutex.
        func notifyAll(): Unit
    }


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
var waitUnlocked:Bool = false

main(): Int64 {
    let m = Mutex()
    let c = synchronized(m) { m.condition() }

    // checking thread lock
    let fut1 = spawn {
        threadStarted = true
        let (_, time1) = measure({ =>
            synchronized(m) {
                Assert.isTrue(c.wait(timeout: Duration.nanosecond * LONG_TIMEOUT) is Bool,
                    reason: "Checking wait return type")
            }
        })

        waitUnlocked = true
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

    while (!waitUnlocked) {
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
    Assert.equals(0xA, fut1.get(), reason: "Thread should be terminated")
    Assert.equals(0xB, fut2.get(), reason: "Thread2 should be terminated")

    // Exceptions
    // wait with timeout
    let fut3 = spawn {
        c.wait(timeout: Duration.nanosecond * 10)
        return 0xA
    }
    Assert.throws({ => fut3.get() }, check: { e => e is IllegalSynchronizationStateException})

    // wait without timeout
    let fut4 = spawn {
        c.wait()
        return 0xA
    }
    Assert.throws({ => fut4.get() }, check: { e => e is IllegalSynchronizationStateException})

    // notify
    Assert.throws({ => c.notify() }, check: { e => e is IllegalSynchronizationStateException})

    // notifyAll
    Assert.throws({ => c.notifyAll() }, check: { e => e is IllegalSynchronizationStateException})

    // Notify without waiting threads
    synchronized(m) {
        Assert.isTrue(c.notify() is Unit,
            reason: "Checking notify return type")

        Assert.isTrue(c.notifyAll() is Unit,
            reason: "Checking notify return type")
    }
    return 0
}

