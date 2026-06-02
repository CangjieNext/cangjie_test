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
class PrecedenceTest {
    @TestCase
    func test1() {
        @PowerAssert(true, true && false)
    }

    /* SCAN-IN
    Assert Failed: `(true == true && false)`
                            |_____________|
                                 false
     */
    @TestCase
    func test2() {
        @PowerAssert(true || false || true, true && true && false && false)
    }

    /* SCAN-IN
    Assert Failed: `(true || false || true == true && true && false && false)`
                    |_____________|       |  |____________|        |        |
                    |     true            |  |    true             |        |
                    |_____________________|  |_____________________|        |
                              true           |        false                 |
                                             |______________________________|
                                                           false
     */
}
