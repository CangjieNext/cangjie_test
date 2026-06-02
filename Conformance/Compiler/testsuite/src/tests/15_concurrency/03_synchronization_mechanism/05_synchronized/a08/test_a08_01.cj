/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a08_01

  @Level:         1
  @Assertion:    15.3.5(8) • If an exception occurs in the synchronized code
                 block that causes the program to exit that code block,
                 m.unlock() gets called automatically.

  @Description:  Checks that mutex is unlocked in case exception is throm from
                 synchronized section

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../aux_sync_lock_unlock.cj

*/

import std.sync.*  // Atomics
import sync_lock_unlock.*

main(): Int64 {
    testWithException(Mutex())

    return 0
}
