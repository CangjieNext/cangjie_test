/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a01_01

  @Level:         1
  @Assertion:    15.3.1(1) Atomic operations ensure that instructions are
                 executed in an atomic (non-divisible) manner, i.e., there are
                 no interruptions during the execution.

  @Description:  Checks that intensive multithreaded fetchAdd/fetchSub will not
                 break AtomicInt64

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

*/

import std.sync.*  // Multithreading
import utils.assert.Assert
import thread_commons.*

main(): Int64 {
    let threads = 16
    let iterCount = 20_000
    let fake = 256
    let multiplier = 64
    let counter = AtomicInt64(0)

    let starterAdd = ThreadStarter<Unit>(threads){i =>
        return spawn {
            for (i in 0..iterCount) {
                counter.fetchAdd(fake)
                counter.fetchAdd(multiplier)
            }
        }
    }
    let starterSub = ThreadStarter<Unit>(threads){i =>
        return spawn {
            for (i in 0..iterCount) {
                counter.fetchSub(fake)
            }
        }
    }

    // wait for results
    let resultsAdd = starterAdd.waitAll()
    let resultsSub = starterSub.waitAll()

    Assert.equals(threads * iterCount * multiplier, counter.load())
    return 0
}
