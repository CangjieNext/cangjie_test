/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_06_a03_01

  @Level:         1
  @Assertion:    15.3.6(3) Before calling the wait notify or notifyAll methods
                 of the Monitor object, you need to ensure that the
                 corresponding Monitor lock is held by the current thread.

  @Description:  Checks that ISSE is thrown in case wait, notify or notifyAll
                 is called by the thread not owning current mutex

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

import utils.assert.Assert

main(): Int64 {
    let m = Mutex()
    let c = synchronized(m) { m.condition() }

    // wait with timeout
    let fut1 = spawn {
        c.wait(timeout: Duration.nanosecond * 10)
        return 0xA
    }
    Assert.throws({ => fut1.get() }, check: { e => e is IllegalSynchronizationStateException})

    // wait without timeout
    let fut2 = spawn {
        c.wait()
        return 0xA
    }
    Assert.throws({ => fut2.get() }, check: { e => e is IllegalSynchronizationStateException})

    // notify
    Assert.throws({ => c.notify() }, check: { e => e is IllegalSynchronizationStateException})

    // notifyAll
    Assert.throws({ => c.notifyAll() }, check: { e => e is IllegalSynchronizationStateException})
    return 0
}
