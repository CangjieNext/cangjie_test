/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_02_a09_01

  @Level:         1
  @Assertion:    15.4.2(9) • Atomic Variable Rule: All operations on atomic
                 variables form a total order. An operation on an atomic
                 variable of a thread happens-before all subsequent operations
                 on atomic variables in this total order.

  @Description:  Checks that Atomic variable are being changed in certain order
                 i.e. "modification" threads are changing atomics in ascending order
                 so at any given moment
                 counters[0] >= counters[1] >= counters[2] >= .....
                 "check" threads verifies such behavior

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

*/

import std.sync.*  // Multithreading
import thread_commons.*
import utils.assert.Assert

main(): Int64 {
    let modThreadCount = 4
    let checkThreadCount = 8
    let iterations = 100
    let counters = Array<AtomicInt64>(25){i => AtomicInt64(0)}
    let done = AtomicBool(false)

    let checkStarter = ThreadStarter<Unit>(checkThreadCount){i =>
        return spawn {
            while (!done.load()) {
                for (counterIdx in 0..counters.size - 1) {
                    let valNext = counters[counterIdx + 1].load()
                    let valCur = counters[counterIdx].load()
                    Assert.isTrue(valNext <= valCur,
                        reason: "Counter[${counterIdx}] value should be greater or equals to Counter[${counterIdx + 1}] value; in fact: ${valCur} < ${valNext}")
                }
            }
        }
    }

    let modStarter = ThreadStarter<Unit>(modThreadCount){i =>
        return spawn {
            for (iter in 0..iterations) {
                for (counter in counters) {
                    counter.fetchAdd(1)
                }
            }
        }
    }

    // wait for results
    let modResults = modStarter.waitAll()
    done.store(true)
    let checkResults = checkStarter.waitAll()

    return 0
}
