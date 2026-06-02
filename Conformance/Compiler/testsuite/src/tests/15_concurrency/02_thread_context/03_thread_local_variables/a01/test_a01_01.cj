/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_03_a01_01

  @Level:         1
  @Assertion:    15.2.3(1) Class ThreadLocal can be used to define thread-local
                 variables.

  @Description:  Checks that ThreadLocal variable can be created and used by
                 the thread

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006095

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

let a = ThreadLocal<Int32>()

main(): Int64 {
    let fut: Future<Unit> = spawn {
        a.set(100)
        Assert.equals(100, a.get().getOrThrow())
    }
    fut.get()

    Assert.isNone<Int32>(a.get())
    return 0
}
