/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_03_a02_02

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

  @Description:  Checks that there is global function hasPendingCancellation()
                 returning Bool. This function should return `false` for main
                 thread.

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @CompileWarning: no
  @Issue:        0006621

*/

import std.sync.*  // Concurrency
import utils.assert.Assert

main(): Int64 {
    Assert.isTrue(Thread.currentThread.hasPendingCancellation is Bool)
    Assert.isFalse(Thread.currentThread.hasPendingCancellation)

    return 0
}
