/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_01_a01_01

  @Level:         1
  @Assertion:    15.2.1(1)  Interface ThreadContext is defined as following:
    • The termination method end is used to send a shutdown request to the
        thread context (see below for a description of ThreadContext
        termination).
    • The check method hasEnded is used to check whether the current context
        has ended.
    interface ThreadContext {
        func end(): Unit
        func hasEnded(): Bool
    }

  @Description:  Checks that ThreadContext contains all required methods

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

  @Issue:        0006087

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

main(): Int64 {
    for (ctx in [MainThreadContext(), PythonThreadContext(), JSThreadContext()]) {
        Assert.isTrue(ctx.end() is Unit)
        Assert.isTrue(ctx.hasEnded() is Bool)
    }
    return 0
}

