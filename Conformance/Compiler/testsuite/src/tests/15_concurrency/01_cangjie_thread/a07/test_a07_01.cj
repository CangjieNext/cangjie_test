/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a07_01

  @Level:         1
  @Assertion:    15.1(7) A thread can be created and launched by the keyword
                 spawn followed by an optional argument of type ThreadContext
                 (see below for a description of ThreadContext) and a lambda
                 without formal parameters.

  @Description:  Checks that thread can be created and launched using `spawn`
                 without thread context
  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let th = spawn {
        25
    }
    Assert.equals(25, th.get(), reason: "Thread result should match")
    0
}
