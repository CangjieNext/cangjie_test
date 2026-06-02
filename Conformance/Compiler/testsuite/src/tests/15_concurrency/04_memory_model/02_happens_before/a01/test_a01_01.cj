/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_02_a01_01

  @Level:         1
  @Assertion:    15.4.2(1) • Program Order Rule: Each operation in a thread
                 happens before every subsequent operation in the same thread.

  @Description:  Checks that order of operations in single threaded app is
                 correct

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
    orderAdd(0)
    let threads = 50
    orderAdd(1)

    foo()
    orderAdd(3)

    if (threads > 2) {
        orderAdd(4)
    }
    orderAdd(5)

    orderCheck()

    return 0
}
