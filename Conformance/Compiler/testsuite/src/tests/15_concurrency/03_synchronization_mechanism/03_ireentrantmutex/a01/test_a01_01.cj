/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_03_a01_01

  @Level:         1
  @Assertion:    15.3.3(1) IReentrantMutex is a common interface for reentrant
                 mutual exclusion concurrency primitives, provides the
                 following methods that needs developers to implement:
                   - lock(): Unit:  acquire the lock, blocks the current thread
                   if the mutex is not available.
                   - tryLock(): Bool:  try to acquire the lock
                   - unlock(): Unit:  release the lock

  @Description:  Checks that mutexes are implementing IReentrantMutex interface.

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @CompileWarning: no

*/
import std.sync.*  // Mutex
import utils.assert.Assert

func test<T>(x: T): Bool where T <: Lock {
    x.lock()
    x.unlock()
    let success = x.tryLock()
    x.unlock()
    return success
}

main(): Int64 {
    Assert.isTrue(test(Mutex()))

    0
}
