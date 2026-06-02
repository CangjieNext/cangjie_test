/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_01_a03_01

  @Level:         1
  @Assertion:    15.2.1(3) The Cangjie Language provides the following thread
                 context types according to usage scenarios:
                 • MainThreadContext: Users can use this thread context for UI
                   application development from the UI framework library;

  @Description:  Checks that MainThreadContext can be created and used

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

  @Issue:        0006087

*/

import std.sync.*  // Multithreading

let STR = ##"""
hello,
cangjie!"""##

main(): Int64 {
    let ctx = MainThreadContext()
    let fut = spawn (ctx) {
        return STR
    }
    Assert.equals(STR, fut.get())

    return 0
}

