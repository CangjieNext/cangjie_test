/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a02_01

  @Level:         1
  @Assertion:    15.3.5(2) An instance of ReentrantMutex itself or a derived
                 class may be passed as an argument to the synchronized
                 keyword, which will result in the following transformation:

    //=======================================
    // `synchronized` expression
    //=======================================
    let m: ReentrantMutex = ...
    synchronized(m) {
      foo()
    }

    //=======================================
    // is equivalent to the following program.
    //=======================================
    let m: ReentrantMutex = ...
    m.lock()
    try {
      foo()
    } finally {
      m.unlock()
    }

  @Description:  Checks that mutex.lock() is called at the beginning of
                 synchronized section, and mutex.unlock() is called at the end

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../aux_sync_lock_unlock.cj

*/

import std.sync.*  // Atomics
import sync_lock_unlock.*

main(): Int64 {
    testSyncLockUnlock(Mutex())

    return 0
}
