/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_02_a10_01

  @Level:         1
  @Assertion:    15.4.2(10) • Transitive Rule: If A happens before B, and B
                 happens before C, then A happens before C.

  @Description:  Checks that Transitive Rule works using two threads

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
    let fut1 = spawn {
        orderAdd(0)
        let threads = 50
        orderAdd(1)

        foo()
        orderAdd(3)

        if (threads > 2) {
            orderAdd(4)
        }
    }

    fut1.get()
    orderAdd(5)

    let fut2 = spawn {
        orderAdd(6)
        let aa = -5
        orderAdd(7)
    }
    fut2.get()
    orderAdd(8)

    orderCheck()
    return 0
}
