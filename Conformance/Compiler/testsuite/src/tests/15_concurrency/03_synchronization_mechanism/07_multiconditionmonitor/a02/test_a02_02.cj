/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_07_a02_02

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

  @Description:  Checks that MultiConditionMonitor.wait() will wait forever

  @Mode:         run
  @Negative:     no
  @ExpectTimeout
  @Structure:    single

  @Issue:        0006629

*/

import std.sync.*  // Atomics

main(): Int64 {
    let m = Mutex()
    let condId:Condition
    synchronized(m) {
        condId = m.condition()
    }

    let fut = spawn {
        synchronized(m) {
            condId.wait()
        }
        return 0xA
    }
    fut.get() // will wait forever
    return 0
}
