/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_06_a02_02

  @Level:         1
  @Assertion:    15.3.6(2) A Monitor provides the following methods:
    • wait(timeout!: Duration = Duration.Max): Bool:  Wait for a signal,
                        blocking the current thread.
    • notify(): Unit:  Wake up one thread of those waiting on the monitor, if any.
    • notifyAll(): Unit:  Wake up all threads waiting on the monitor, if any.

  @Description:  Checks that Monitor.wait() will wait forever

  @Mode:         run
  @Negative:     no
  @ExpectTimeout
  @Structure:    single

  @Issue:        0006629

*/

import std.sync.*  // Concurrency

main(): Int64 {
    let m = Mutex()
    let c = synchronized(m) { m.condition() }

    let fut = spawn {
        synchronized(m) {
            c.wait()
        }
        return 0xA
    }
    fut.get() // will wait forever
    return 0
}
