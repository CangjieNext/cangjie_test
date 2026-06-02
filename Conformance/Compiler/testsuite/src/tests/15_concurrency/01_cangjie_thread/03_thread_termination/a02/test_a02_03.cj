/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_03_a02_03

  @Level:         1
  @Assertion:    15.1.3(2) In addition, the method cancel() of Future<T> can
                 send a termination request to its corresponding thread. A
                 global function hasPendingCancellation() can be used to check
                 whether the currently executing thread has any termination
                 requests. Programmers themselves are responsible for handling
                 termination requests, that is, deciding if and how to
                 terminate the thread, depending on the check function.
    class Future<T> {
        //...
        // Send a termination request to its executing thread.
        public func cancel(): Unit
    }
    // Check whether the current thread has termination requests.
    public func hasPendingCancellation(): Bool

  @Description:  Checks that Future.cancel() call has no effect in case
                 developer doesn't handle it. Also checks cancel() can be
                 called for terminated thread.

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @CompileWarning: no
  @Issue:        0006620 0006621

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert

var result:Int64 = 0

main(): Int64 {
    let stop = AtomicBool(false)

    let f: Future<Int64> = spawn {
        while (!stop.load()) {
            result++
            sleep(Duration.nanosecond * 100)
        }
        return result
    }

    Assert.isTrue(f.cancel() is Unit)
    sleep(Duration.nanosecond * 1_000) // pause main thread

    Assert.isTrue(f.cancel() is Unit) // second call

    let counter = result
    sleep(Duration.nanosecond * 10_000) // pause main thread
    stop.store(true)

    Assert.isTrue(f.get() >= counter)

    Assert.isTrue(f.cancel() is Unit) // call after thread termination

    return 0
}
