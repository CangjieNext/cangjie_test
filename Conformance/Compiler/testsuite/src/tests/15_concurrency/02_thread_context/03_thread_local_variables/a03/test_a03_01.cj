/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_03_a03_01

  @Level:         1
  @Assertion:    15.2.3(3) Class ThreadLocal<T> is defined as following.
     Constructor method init is used to define thread-local variables.

  @Description:  Checks that ThreadLocal has value None after construction

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006095

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

let a = ThreadLocal<String>()

main(): Int64 {
    let fut1: Future<Unit> = spawn {
        Assert.isNone<String>(a.get())
    }

    Assert.isNone<String>(a.get())

    return 0
}
