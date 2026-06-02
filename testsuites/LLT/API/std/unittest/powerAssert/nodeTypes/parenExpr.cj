/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let myVal = 28
        @PowerAssert((((myVal))) <= 4)
    }

    /* SCAN-IN
    Assert Failed: `((((myVal))) <= 4)`
                       |_____|
                          28

     */
    @TestCase
    func case2(): Unit {
        let x = 28
        @PowerAssert(((x) + ((((x))))) <= (x))
    }

    /* SCAN-IN
    Assert Failed: `(((x) + ((((x))))) <= (x))`
                     ||_|      |_|   |    |_|
                     | 28       28   |     28
                     |_______________|
                             56
     */
}
