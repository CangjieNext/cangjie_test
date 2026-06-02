/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a02_01

  @Level:         1
  @Assertion:    15.3.1(2) Furthermore, a write operation on an atomic variable
                 is always visible to its subsequent read operations on the
                 same atomic variable.

  @Description:  Checks that write operation is immediately visible to other
                 threads

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import std.random.Random
import utils.assert.Assert
import thread_commons.*

let MOD = 0x29A

main(): Int64 {
    let threads = 16
    let atom = AtomicInt64(0)
    let now = nanoTime()

    let starter = ThreadStarter<Int64>(threads){i =>
        return spawn {
            while (atom.load() != MOD) {
                sleep(Duration.nanosecond)
            }
            return nanoTime() - now
        }
    }

    let fut = spawn {
        let rnd = Random()
        sleep(Duration.nanosecond * Int64(rnd.nextUInt64(10_000)))
        var temptime = nanoTime() - now
        atom.store(MOD)
        return temptime
    }

    // wait for results
    let time = fut.get()
    let results = starter.waitAll()

    for (i in 0..results.size) {
        Assert.isTrue(results[i] > time)
    }
    return 0
}
