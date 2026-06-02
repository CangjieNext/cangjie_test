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
class FuncDeclTest {
    @TestCase
    func case1() {
        let v = 25678
        @PowerAssert({ => 
            func foo(arg: ToString): String { arg.toString() + "!" }
            foo(v) + foo(25)
        }(), v.toString())
    }

    /* SCAN-IN
    Assert Failed: `({ => func foo(arg: ToString): String { arg.toString() + "!" }; foo(v) + foo(25) }() == v.toString())`
                    |                                                              |   |_|| |_______|   |  |_|          |
                    |                                                              |  25678   "25!" |   | 25678         |
                    |                                                              |______|         |   |  |____________|
                    |                                                              "25678!"         |   |      "25678"
                    |                                                              |________________|   |
                    |                                                                  "25678!25!"      |
                    |___________________________________________________________________________________|
                                                         "25678!25!"
     */
}
