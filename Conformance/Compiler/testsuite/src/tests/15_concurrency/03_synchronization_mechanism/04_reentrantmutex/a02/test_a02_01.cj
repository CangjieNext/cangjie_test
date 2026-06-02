/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_04_a02_01

  @Level:         1
  @Assertion:    15.3.4(2)
                 ReentrantMutex is a reentrant lock, i.e., if a
                 thread tries to acquire a ReentrantMutex lock that it already
                 holds, it will acquire the ReentrantMutex lock immediately.
                 In order to successfully release the lock, the number of calls
                 to unlock must match the number of calls to lock.

  @Description:  Checks that ReentrantMutex is actually re-entrant.

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../thread_commons.cj

  @CompileWarning: no

*/
import std.sync.*  // Mutex
import utils.assert.Assert
import thread_commons.*

let m = Mutex()
var boolVar = false

main(): Int64 {
    m.lock()

    let t = spawn {
        let (tryLockRes, time) = measure({ => m.tryLock()})
        Assert.isFalse(tryLockRes, reason: "Mutex can't be locked")
        Assert.isTrue(time < 100_000, reason: "The instruction should be executed immediately ${time}")
        m.lock() // mutex already locked, so this thread should wait here

        boolVar = true
        m.unlock()
        return true
    }
    try {
        var res = t.get(Duration.nanosecond * 3_000_000_000) // wait for 3 seconds
    } catch (e: TimeoutException) {
        println(e)
    }
    Assert.isFalse(boolVar, reason: "Boolean variable shouldn't be changed")

    m.unlock()
    var res = t.get()
    Assert.isSome(res, reason: "The result should be available")
    Assert.isTrue(boolVar, reason: "Boolean variable should be changed")
    0
}
