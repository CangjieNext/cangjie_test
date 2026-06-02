/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a03_01

  @Level:         1
  @Assertion:    15.3.5(3) Note: The synchronized keyword is not compatible
                 with IReentrantMutex interface.

  @Description:  Checks that IReentrantMutex can not be used with synchronized

  @Mode:         compileonly
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../dumb_mutex.cj

  @CompileWarning: no

*/

import std.sync.*  // Concurrency
import std.time.* // Duration

main(): Int64 {
    synchronized(DumbMutex()) {
        sleep(Duration.nanosecond * 10)
    }

    return 0
}
