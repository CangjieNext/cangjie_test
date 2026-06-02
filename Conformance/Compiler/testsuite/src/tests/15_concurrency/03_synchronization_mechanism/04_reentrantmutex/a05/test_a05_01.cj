/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_04_a05_01

  @Level:         1
  @Assertion:    15.3.4(5)
    // Base class for built-in reentrant mutual exclusion concurrency
    // primitives.
    open class ReentrantMutex <: IReentrantMutex {
        // Constructor.
        init()

        // Locks the mutex, blocks current thread if the mutex is not available.
        public func lock(): Unit

        // Tries to lock the mutex, returns false if the mutex is not
        // available, otherwise locks the mutex and returns true.
        public func tryLock(): Bool

        // Unlocks the mutex. If the mutex was locked repeatedly N times, this
        // method should be invoked N times to
        // fully unlock the mutex. Once the mutex is fully unlocked, unblocks
        // one of the threads waiting in its `lock` method, if any
        // (no particular admission policy implied).
        // Throws ISSE("Mutex is not locked by the current thread") if the
        // current thread does not hold this mutex.
        public func unlock(): Unit
    }

  @Description:  Checks that ReentrantMutex can be inherited and acts as
                 expected.

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006163,0006505

  @CompileWarning: no

*/
import std.sync.*  // Mutex
import utils.assert.Assert
import std.random.Random


main(): Int64 {
    let x = Mutex()
    let rnd = Random()
    let amount = rnd.nextUInt32(100)
    for (i in 0..amount) {
        x.lock()
    }
    for (i in 0..amount) {
        x.unlock()
    }
    Assert.isTrue(x.tryLock())
    x.unlock()

    try {
        x.unlock()
        Assert.fail()
    } catch (e:IllegalSynchronizationStateException) {
        Assert.pass()
    }

    0
}
