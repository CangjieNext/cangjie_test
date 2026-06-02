/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_07_a02_05

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

  @Description:  Checks that MultiConditionMonitor.notifyAll(id) will unblock
                 own threads only

  @Mode:         run
  @Negative:     no
  @ExpectTimeout
  @Structure:    single

  @Issue:        0006629

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert

var thread1Started:Bool = false
var thread2Started:Bool = false

main(): Int64 {
    let m = Mutex()
    let condId1:Condition
    let condId2:Condition
    synchronized(m) {
        condId1 = m.condition()
        condId2 = m.condition()
    }

    let fut1 = spawn {
        thread1Started = true
        synchronized(m) {
            condId1.wait()
        }
        return 0xA
    }
    let fut2 = spawn {
        thread2Started = true
        synchronized(m) {
            condId1.wait()
        }
        return 0xB
    }
    let fut3 = spawn {
        thread2Started = true
        synchronized(m) {
            condId2.wait()
        }
        return 0xC
    }
    while (!thread1Started || !thread2Started) {
        sleep(Duration.nanosecond * 10) // waiting for the thread
    }
    sleep(Duration.nanosecond * 100_000) // sleep some reasonable amount of time
    synchronized(m) {
        // unlock all threads of first queue
        condId1.notifyAll()
    }
    Assert.equals(0xA, fut1.get(), reason: "Thread 1 should be terminated")
    Assert.equals(0xB, fut2.get(), reason: "Thread 2 should be terminated")

    fut3.get() // will wait forever
    return 0
}
