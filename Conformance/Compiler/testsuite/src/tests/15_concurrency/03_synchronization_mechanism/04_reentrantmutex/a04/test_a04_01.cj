/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_04_a04_01

  @Level:         1
  @Assertion:    15.3.4(4) Note: ReentrantMutex is a built-in lock that does
                 not allow developers to inherit.

  @Description:  Checks that ReentrantMutex can't be inherited.

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

  @Issue:        0006163

  @CompileWarning: no

*/

import std.sync.*  // Mutex

class MyReentrantMutex <: Mutex {
}

main(): Int64 {
    0
}

