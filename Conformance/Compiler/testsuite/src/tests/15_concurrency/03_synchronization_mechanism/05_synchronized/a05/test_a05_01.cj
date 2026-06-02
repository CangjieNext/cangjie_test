/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a05_01

  @Level:         1
  @Assertion:    15.3.5(5) • The thread automatically releases the mutex m when
                 it leaves a synchronized(m) code block. Only one unlock
                 operation is performed, so nested blocks synchronized on the
                 same mutex are allowed.

  @Description:  Checks that mutex can be re-used after exit from synchronized
                 section

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../aux_sync_lock_unlock.cj

*/

import std.sync.*  // Atomics
import sync_lock_unlock.*

main(): Int64 {
    testWithoutException(Mutex())

    return 0
}
