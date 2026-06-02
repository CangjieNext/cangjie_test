/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a09_01

  @Level:         1
  @Assertion:    15.3.5(9) The syntax of the synchronized expression is as follows:
    synchronizedExpression
         : 'synchronized' '(' identifier ')' block
         ;
    The above identifier is a ReentrantMutex object.

  @Description:  Checks that valid synchronized expression can be created

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import std.sync.*  // Atomics
import utils.assert.Assert

func sync(m: Mutex) {
    synchronized (m) {
        return 0
    }
}

func test(m: Mutex) {
    Assert.isTrue(m.tryLock(), reason: "Mutex should be unlocked")
    m.unlock()
}

main(): Int64 {
    test(Mutex())

    return 0
}
