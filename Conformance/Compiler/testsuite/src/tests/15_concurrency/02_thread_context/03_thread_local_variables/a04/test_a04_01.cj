/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_03_a04_01

  @Level:         1
  @Assertion:    15.2.3(4) If a variable is defined but not assigned with any
                 value, None value will be obtained when a thread accesses it.

  @Description:  Checks that ThreadLocal has value None after construction

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006095

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

let a = ThreadLocal<Bool>()

main(): Int64 {
    let fut1: Future<Unit> = spawn {
        Assert.isNone<Bool>(a.get())
    }

    Assert.isNone<Bool>(a.get())

    return 0
}
