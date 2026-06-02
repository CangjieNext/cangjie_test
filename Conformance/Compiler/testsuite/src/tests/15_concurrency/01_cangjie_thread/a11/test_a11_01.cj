/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a11_01

  @Level:         1
  @Assertion:    15.1(11) In the process of executing the spawn expression, the
                 closure will be encapsulated into a runtime task and submitted
                 to the scheduler. The scheduler’s strategy determines when to
                 execute the task. Once the spawn expression is executed, the
                 corresponding thread is ready to execute.

  @Description:  Checks that spawn expression is executed

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006098

*/

import utils.assert.Assert

let gLet = 5
var gVar = 666

func gStart():Future<Bool> {
    spawn {
        return gVar * gLet > 10
    }
}

main(): Int64 {
    Assert.isTrue(gStart().get())
    0
}
