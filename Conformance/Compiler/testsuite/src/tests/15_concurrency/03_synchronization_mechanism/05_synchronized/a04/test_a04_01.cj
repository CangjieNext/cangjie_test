/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a04_01

  @Level:         1
  @Assertion:    15.3.5(4) • The thread automatically tries to acquire the lock
                 of the mutex m before entering a synchronized(m) code block,
                 if acquisition fails, the thread gets blocked.

  @Description:  Checks that thread is locked in case mutex m can't be blocked
                 before entering a synchronized(m) code block

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert

var beforeSync:Bool = false
var insideSync:Bool = false

func test(m: Mutex) {
    // Let's reset the flags
    beforeSync = false
    insideSync = false

    m.lock() // let's lock the mutex
    let fut = spawn {
        beforeSync = true
        synchronized(m) {
            insideSync = true;
        }
        return 0
    }
    while (!beforeSync) {
        sleep(Duration.nanosecond * 10)
    }
    sleep(Duration.second) // we will wait for 1 second to ensure thread is locked
    Assert.isFalse(insideSync, reason: "The lock should be locked")
    m.unlock() // let's unlock the mutex

    Assert.equals(0, fut.get(), reason: "Future result should match")

    Assert.isTrue(insideSync, reason: "The lock should be unlocked")
}

main(): Int64 {
    test(Mutex())

    return 0
}
