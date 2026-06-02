/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_03_a02_01

  @Level:         1
  @Assertion:    15.3.3(2)
    interface IReentrantMutex {
        // Locks the mutex, blocks the current thread if the mutex is not available.
        public func lock(): Unit

        // Tries to lock the mutex, returns false if the mutex is not
        // available, otherwise locks the mutex and returns true.
        public func tryLock(): Bool

        // Unlocks the mutex. If the mutex was locked repeatedly N times, this
        // method should be invoked N times to
        // fully unlock the mutex. When the mutex is fully unlocked, unblocks
        // one of the threads waiting on its `lock`
        // (no particular admission policy implied).
        // Throws ISSE("Mutex is not locked by the current thread") if the
        // current thread does not hold this mutex.
        public func unlock(): Unit
    }

  @Description:  Checks that mutexes are implementing IReentrantMutex interface.

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @CompileWarning: no

  @Issue:          0006505

*/
import std.sync.*  // Mutex
import utils.assert.Assert
import std.random.Random

func test<T>(x: T): Bool where T <: Lock {
    let rnd = Random()
    let amount = rnd.nextUInt32(100)
    for (i in 0..amount) {
        x.lock()
    }
    for (i in 0..amount) {
        x.unlock()
    }
    let success = x.tryLock()
    x.unlock()
    return success
}

main(): Int64 {
    Assert.isTrue(test(Mutex()))

    try {
        let m = Mutex()
        m.unlock()
        Assert.fail()
    } catch (e:IllegalSynchronizationStateException) {
        Assert.pass()
    }

    0
}
