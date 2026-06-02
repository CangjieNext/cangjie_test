/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_03_a02_01

  @Level:         1
  @Assertion:    15.2.3(2) Compared to ordinary variables, thread-local
                 variables have a different accessing semantics. If there are
                 multiple threads sharing a thread-local variable, each thread
                 has its own value copy of the variable. Threads will
                 read/write its local value when accessing the variable, and
                 modifications from one thread will not be visible to others.
                 Thus, ThreadLocal<T> is thread-safe.

  @Description:  Checks that ThreadLocal variable is thread-safe i.e.
                 modifications from one thread will not be visible to others

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006095

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert

let a = ThreadLocal<Int64>()

main(): Int64 {
    let stop = AtomicBool(false)

    try {
        let fut1: Future<Unit> = spawn {
            let base = 1_000;
            var i = 0;
            while (!stop.load()) {
                a.set(base + i)
                sleep(Duration.nanosecond * 100)
                Assert.equals(base + i, a.get().getOrThrow())
                i++
            }
        }
        let fut2: Future<Unit> = spawn {
            let base = 1_000_000;
            var i = 0;
            while (!stop.load()) {
                a.set(base + i)
                sleep(Duration.nanosecond * 100)
                Assert.equals(base + i, a.get().getOrThrow())
                i++
            }
        }

        for (i in 0..1_000_000) {
            Assert.isNone<Int64>(a.get())
            sleep(Duration.nanosecond)
        }
    } finally {
        stop.store(true);
    }
    return 0
}
