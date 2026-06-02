/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_03_a04_01

  @Level:         1
  @Assertion:    15.3.3(4) 2. It is a responsibility of the implementor to
                 throw IllegalSynchronizationStateException if the contract
                 is violated.

  @Description:  Checks that dumb implementation of IReentrantMutex doesn't
                 throw IllegalSynchronizationStateException

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../../dumb_mutex.cj

  @CompileWarning: no

  @Issue:          0006505

*/
import utils.assert.Assert

main(): Int64 {
    try {
        let m = DumbMutex()
        m.unlock()
        Assert.pass()
    } catch (e:IllegalSynchronizationStateException) {
        Assert.fail()
    }

    0
}
