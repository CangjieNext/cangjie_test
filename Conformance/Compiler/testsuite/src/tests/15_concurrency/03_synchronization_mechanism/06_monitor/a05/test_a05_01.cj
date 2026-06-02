/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_06_a05_01

  @Level:         1
  @Assertion:    15.3.6(5) Note: The wait method accepts an optional timeout
                 parameter.

  @Description:  Checks that wait(timeout) will wait at least timeout ns

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
                Assert.isFalse(c.wait(timeout: Duration.nanosecond * RANDOM_TIMEOUT),
                    reason: "This thread should get timeout")
            }
        })

        Assert.isTrue(time1 >= RANDOM_TIMEOUT,
            reason: "Thread should wait for at least ${RANDOM_TIMEOUT}ns")
        return 0xA
    }

    Assert.equals(0xA, fut.get(), reason: "Thread should be terminated")
    return 0
}
