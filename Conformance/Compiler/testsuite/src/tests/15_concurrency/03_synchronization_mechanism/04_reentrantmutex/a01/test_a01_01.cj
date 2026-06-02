/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_04_a01_01

  @Level:         1
  @Assertion:    15.3.4(1) A ReentrantMutex provides the following methods: 
    • lock(): Unit:  acquire the lock, blocks the current thread if the mutex
                     is not available. 
    • tryLock(): Bool:  try to acquire the lock 
    • unlock(): Unit:  release the lock

  @Description:  Checks that ReentrantMutex provides lock, tryLock and unlock
                 methods.

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @CompileWarning: no

*/
import std.sync.*  // Mutex
import utils.assert.Assert

main(): Int64 {
    let m = Mutex()
    Assert.isTrue(m.lock() is Unit)
    Assert.isTrue(m.unlock() is Unit)
    Assert.isTrue(m.tryLock())
    m.unlock()

    0
}
