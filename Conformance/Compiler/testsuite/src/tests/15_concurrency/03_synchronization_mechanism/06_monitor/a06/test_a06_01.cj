/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_06_a06_01

  @Level:         1
  @Assertion:    15.3.6(6) Be aware that many conventional operating systems
                 commonly used in the industry do not provide real-time
                 guarantees for scheduling, therefore it is not possible to
                 ensure that a thread will be blocked for “precise duration”
                 - a system-specific imprecision may and will be observed.
                 Moreover, the current language specification explicitly allows
                 implementations to emit spurious wakeups - in such a case,
                 value returned by waitis implementation-defined - it maybe
                 either true or false. Therefore, developers are encouraged
                 to always wrap waitinto a condition-testing loop:

    synchronized (obj) {
       while (<condition is not true>) {
         obj.wait();
       }
    }

  @Description:  Checks that wait consume more time than requested

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert
import thread_commons.*

main(): Int64 {
    let m = Mutex()
    let c = synchronized(m) { m.condition() }

    let fut = spawn {
        let (_, time1) = measure({ =>
            synchronized(m) {
                Assert.isFalse(c.wait(timeout: Duration.nanosecond * RANDOM_TIMEOUT))
            }
        })

        Assert.isTrue(time1 >= RANDOM_TIMEOUT,
            reason: "Thread should wait for at least ${RANDOM_TIMEOUT}ns")
        return 0xA
    }

    Assert.equals(0xA, fut.get(), reason: "Thread should be terminated")
    return 0
}
