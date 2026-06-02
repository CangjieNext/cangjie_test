/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a01_02

  @Level:         1
  @Assertion:    15.3.1(1) Atomic operations ensure that instructions are
                 executed in an atomic (non-divisible) manner, i.e., there are
                 no interruptions during the execution.

  @Description:  Checks that intensive multithreaded fetchAdd will not break
                 AtomicInt32

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

*/

import std.sync.*  // Multithreading
import utils.assert.Assert
import thread_commons.*

main(): Int64 {
    let threads = 8
    let iterCount = 20_000
    let multiplier = 10i32
    let counter = AtomicInt32(0)

    let starter = ThreadStarter<Unit>(threads){i =>
        return spawn {
            for (i in 0..iterCount) {
                counter.fetchAdd(multiplier)
            }
        }
    }

    // wait for results
    let results = starter.waitAll()

    Assert.equals(Int32(threads * iterCount) * multiplier, counter.load())
    return 0
}
