/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_07_a05_02

  @Level:         1
  @Assertion:    15.3.7(5)
    class MultiConditionMonitor <: ReentrantMutex {
       // Constructor.
       init()

       // Returns a new ConditionID associated with this monitor. May be used
       // to implement
       // "single mutex -- multiple wait queues" concurrent primitives.
       // Throws ISSE("Mutex is not locked by the current thread") if the
       // current thread does not hold this mutex.
       func newCondition(): ConditionID

       // Blocks until either a paired `notify` is invoked or `timeout`
       // toNanoseconds pass.
       // Returns `true` if the specified condition was signalled by another
       // thread or `false` on timeout.
       // Spurious wakeups are allowed.
       // Throws ISSE("Mutex is not locked by the current thread") if the
       // current thread does not hold this mutex.
       // Throws ISSE("Invalid condition") if `id` was not returned by
       // `newCondition` of this MultiConditionMonitor instance.
       func wait(id: ConditionID, timeout!: Duration.Max): Bool

       // Wakes up a single thread waiting on the specified condition, if any
       // (no particular admission policy implied).
       // Throws ISSE("Mutex is not locked by the current thread") if the
       // current thread does not hold this mutex.
       // Throws ISSE("Invalid condition") if `id` was not returned by
       // `newCondition` of this MultiConditionMonitor instance.
       func notify(id: ConditionID): Unit

       // Wakes up all threads waiting on the specified condition, if any (no
       // particular admission policy implied).
       // Throws ISSE("Mutex is not locked by the current thread") if the
       // current thread does not hold this mutex.
       // Throws ISSE("Invalid condition") if `id` was not returned by
       // `newCondition` of this MultiConditionMonitor instance.
       func notifyAll(id: ConditionID): Unit
    }

  @Description:  Checks that MultiConditionMonitor.wait works same way
                 as Monitor.wait

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

let m = Mutex()

var threadStarted:Bool = false
var threadStartedChecked:Bool = false
var syncEntered:Bool = false
var syncEnteredChecked:Bool = false
var waitPassed:Bool = false
var waitPassedChecked:Bool = false
var syncExit:Bool = false
var syncExitChecked:Bool = false

func checkMonitor(expected: Bool, reason: String):Unit {
    let res = m.tryLock()
    Assert.equals(expected, res, reason: reason)
    if (res) {
        m.unlock()
    }
}

main(): Int64 {
    let condId:Condition
    synchronized(m) {
        condId = m.condition()
    }

    let fut = spawn {
        threadStarted = true
        while(!threadStartedChecked) {
            sleep(Duration.nanosecond * 10)
        }
        synchronized(m) {
            syncEntered = true
            while(!syncEnteredChecked) {
                sleep(Duration.nanosecond * 10)
            }
            condId.wait()
            waitPassed = true
            while(!waitPassedChecked) {
                sleep(Duration.nanosecond * 10)
            }
        }
        syncExit = true
        while(!syncExitChecked) {
            sleep(Duration.nanosecond * 10)
        }
        return 0xA
    }
    while (!threadStarted) {
        sleep(Duration.nanosecond * 10) // waiting for the thread
    }
    checkMonitor(true, "Monitor should be unlocked on thread start")
    threadStartedChecked = true
    while (!syncEntered) {
        sleep(Duration.nanosecond * 10) // waiting for sync section
    }
    checkMonitor(false, "Monitor should be locked in synchronized section")
    syncEnteredChecked = true

    synchronized(m) {
        condId.notify()
    }

    while (!waitPassed) {
        sleep(Duration.nanosecond * 10) // waiting for the thread
    }
    checkMonitor(false, "Monitor should be locked in synchronized section after wait()")
    waitPassedChecked = true

    while (!syncExit) {
        sleep(Duration.nanosecond * 10) // waiting for the thread
    }
    checkMonitor(true, "Monitor should be unlocked outside synchronized section")
    syncExitChecked = true

    Assert.equals(0xA, fut.get(), reason: "Thread should be terminated")
    return 0
}

