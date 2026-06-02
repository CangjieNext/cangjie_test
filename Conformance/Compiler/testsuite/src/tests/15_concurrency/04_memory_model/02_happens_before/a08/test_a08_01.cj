/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_02_a08_01

  @Level:         1
  @Assertion:    15.4.2(8) • Synchronization Rule: Operations on a same
                 synchronization object (e.g., mutex, monitor, etc.) form a
                 total order. An operation on a synchronization object of a
                 thread (e.g., releasing the mutex) happens-before its
                 subsequent operation in the total order of another thread
                 (e.g., acquiring the mutex).

  @Description:  Checks that lock/unlock happen according to total order

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../happens_helper.cj ../../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration
import std.random.Random

import thread_commons.*
import happens_helper.*

main(): Int64 {
    let m:Mutex = Mutex()
    let order:AtomicInt64 = AtomicInt64(0)
    let rnd = Random()

    let threads = 50

    let starter = ThreadStarter<Unit>(threads){i =>
        return spawn {
            m.lock()
            orderAdd(order.fetchAdd(1))
            sleep(Duration.nanosecond * Int64(rnd.nextUInt64(10_000)))

            orderAdd(order.fetchAdd(1))
            m.unlock()
        }
    }

    // wait for results
    let results = starter.waitAll()
    orderAdd(order.fetchAdd(1))

    orderCheck()

    return 0
}
