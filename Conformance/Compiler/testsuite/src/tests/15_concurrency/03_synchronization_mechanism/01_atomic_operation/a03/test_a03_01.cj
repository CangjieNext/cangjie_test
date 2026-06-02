/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a03_01

  @Level:         1
  @Assertion:    15.3.1(3) Moreover, atomic operations are non-blocking and will not
                 block threads.

  @Description:  Checks that multiple threads doing thousands of fetchAdd
                 simultaneously. We cannot prove absence of locks
                 deterministically, so we try to prove it statistically.

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

  @Comment:      Please NOTE this test might fail in case CPU cores are busy

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import std.math.*  // min/max
import utils.assert.Assert
import thread_commons.*

func debug(str: String) {
    // no-op
    println(str)
}

main(): Int64 {
    let m = Mutex()
    let c = synchronized(m) { m.condition() }
    let amount:AtomicInt64 = AtomicInt64(0)

    let threads = 2
    let iterCount = 100_000
    let atom = AtomicInt64(0)
    let now = nanoTime()

    let starter = ThreadStarter<TRes>(threads){i =>
        return spawn {
            let id = Rune(UInt32(r'A') + UInt32(i))
            var tres:TRes = TRes(id, iterCount)
            synchronized(m) {
                amount.fetchAdd(1)
                c.wait()
            }
            for (j in 0..iterCount) {
                atom.fetchAdd(10)
            }
            tres.end = nanoTime()

            return tres
        }
    }
    while (amount.load() < threads) {
        sleep(Duration.nanosecond * 50)
    }
    sleep(Duration.nanosecond * 300_000) // wait enough

    synchronized(m) {
        c.notifyAll()
    }

    // wait for results
    let results = starter.waitAll()

    var lBound = Int64.Min
    var rBound = Int64.Max
    for (tres in results) {
        lBound = max(lBound, tres.begin)
        rBound = min(rBound, tres.end)

        debug("Thread [${tres.id}] -> (${tres.begin - now}, ${tres.end - now})")
    }
    Assert.isTrue(rBound > lBound, reason: "Threads should be executed same time")

    return 0
}
