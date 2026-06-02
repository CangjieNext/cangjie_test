/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_01_a02_06

  @Level:         1
  @Assertion:    3.3.2.1(2) Note that each variable must be initialized before being used.
                 Otherwise, a compilation error is reported.

  @Description:  Checks that mutable function variable can't be used after conditional initialization

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/

enum Test {
    TEST1 | TEST2 | TEST3
}

func func1(trigger: Float64): Test {
    var a: Test
    if (trigger > 666.0) {
        a = TEST2
    }

    return a
}

main() {
    return 1;
}
