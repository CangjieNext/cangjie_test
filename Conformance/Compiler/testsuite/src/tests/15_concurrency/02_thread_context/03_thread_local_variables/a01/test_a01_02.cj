/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_02_03_a01_02

  @Level:         1
  @Assertion:    15.2.3(1) Class ThreadLocal can be used to define thread-local
                 variables.

  @Description:  Checks that ThreadLocal variable can't be created with initial
                 value

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

  @Issue:        0006095 0006615

*/

import std.sync.*  // Multithreading

let a = ThreadLocal<Int32>(100)

main(): Int64 {
    return 0
}
