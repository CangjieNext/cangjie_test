/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_02_a02_01

  @Level:         1
  @Assertion:    15.1.2(2) If the duration argument is zero, i.e.,
                 Duration.Zero, the current thread will only yield its
                 execution but not sleep.
    func sleep (duration :Duration)

  @Description:  Checks that zero timeout will wait some small amount of time.

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

var result:Int64 = 0

func checkTimeout(timeout:Duration, expected:Int64, ignore:Bool) {
    var (_, time) = measure({ => sleep(timeout)})
    if (!ignore) {
        let desc = "We should wait for the result at least ${timeout}, " +
                    "but was ${time}"
        println(desc) // for debug
        Assert.isTrue(time < expected, reason: desc)
    }
    result++ // wake count
}

func checkTimeout(timeouts:Array<Int64>, expected:Int64, ignore:Bool) {
    for (timeout in timeouts) {
        checkTimeout(Duration.nanosecond * timeout, expected, ignore)
    }
}

main(): Int64 {
    let f: Future<Int64> = spawn {
        // for whatever reason first sleep is the longest
        // warm-up run
        checkTimeout([0, -100], 20_000, true)

        checkTimeout(Duration.Zero, 20_000, true)

        // for whatever reason minimal sleep is ~500ns
        checkTimeout([0, -100, -10_000, -1000, -100_000], 10_000, false)
        return result
    }
    let thResult = f.get()

    Assert.equals(result, thResult)

    return 0
}
