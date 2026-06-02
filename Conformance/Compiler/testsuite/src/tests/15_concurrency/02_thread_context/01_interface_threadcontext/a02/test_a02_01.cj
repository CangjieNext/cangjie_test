/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_01_a02_01

  @Level:         1
  @Assertion:    15.2.1(2) Currently, users are not allowed to implement the
                 ThreadContext interface by themselves.

  @Description:  Checks that class can't implement ThreadContext interface

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

  @Issue:        0006087

*/

import std.sync.*  // Multithreading

class MyThreadContext <: ThreadContext {
    public func end():Unit {
        return
    }

    public func hasEnded ():Bool {
        return false
    }
}

main(): Int64 {
    let ctx = MyThreadContext()

    return 0
}

