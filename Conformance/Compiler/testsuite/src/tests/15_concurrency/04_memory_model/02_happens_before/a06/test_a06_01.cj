/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_02_a06_01

  @Level:         1
  @Assertion:    15.4.2(6) If thread A calls future B.cancel() and later thread
                 B calls hasPendingCancellation(), there is a happens-before
                 relation between these two calls.

  @Description:  Checks that hasPendingCancellation() returns true AFTER
                 cancel() was called

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../happens_helper.cj

  @Issue:        0006620 0006621

*/

import happens_helper.*

main(): Int64 {
    let fut = spawn {
        while (true) {
            if (Thread.currentThread.hasPendingCancellation) {
                orderAdd(1)
                return
            }
        }
    }

    orderAdd(0)
    fut.cancel()

    fut.get();
    orderAdd(2)

    orderCheck()
    return 0
}
