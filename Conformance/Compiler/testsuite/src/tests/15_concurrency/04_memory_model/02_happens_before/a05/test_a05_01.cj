/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_02_a05_01

  @Level:         1
  @Assertion:    15.4.2(5) • Thread Termination Rule: If thread A calls future
                 B.get() and thread B terminates successfully, then every
                 operation in thread B happens before the call future B.get()
                 in thread A.

  @Description:  Checks that all operations of terminated thread happens before
                 subsequent call of thread A

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../happens_helper.cj

*/

import happens_helper.*

func foo() {
    orderAdd(2)
}

main(): Int64 {
    let fut = spawn {
        orderAdd(0)
        let threads = 50
        orderAdd(1)

        foo()
        orderAdd(3)

        if (threads > 2) {
            orderAdd(4)
        }
    }

    fut.get()
    orderAdd(5)

    orderCheck()
    return 0
}
