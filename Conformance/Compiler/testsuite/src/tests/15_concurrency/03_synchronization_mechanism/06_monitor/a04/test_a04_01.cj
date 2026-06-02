/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_06_a04_01

  @Level:         1
  @Assertion:    15.3.6(4) The wait method logically consists of the following
                 steps:
   1. Add the current thread into the wait queue associated with this Monitor.
   2. Block the current thread and simultaneously fully release the Monitor
      lock, memorising the number of acquisitions.
   3. Wait until some other thread signals this thread using either notify or
      notifyAll method of the same Monitor instance.
   4. Unblock the current thread and simultaneously acquire the Monitor lock,
      restoring the number of acquisitions memorised on step 2.

  @Description:  Checks that wait works as expected
  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert
import thread_commons.*

let m = Mutex()
let c = synchronized(m) { m.condition() }

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
            c.wait()
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
        c.notify()
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
