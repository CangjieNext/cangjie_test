/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_02_a01_01

  @Level:         1
  @Assertion:    15.1.2(1) There is a function sleep defined in the stdlib sync
                 package that can let the current thread yield its execution
                 and sleep for a duration.

  @Description:  Checks that thread will be sleep for at least `duration`
                 toNanoseconds.

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

  @CompileWarning: no

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert
import thread_commons.*

let result:Int64 = 0x29A

main(): Int64 {
    let f: Future<Int64> = spawn {
        for (timeout in [100_000, 10_000, 1000, 100]) {
            var (_, time) = measure({ => sleep(Duration.nanosecond * timeout)})
            Assert.isTrue(time > timeout, reason: "We should wait for the result at least ${timeout}, but was ${time}")
        }
        return result
    }

    Assert.equals(result, f.get())

    return 0
}
