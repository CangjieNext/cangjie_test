/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan [ FAILED ] CASE: passing
// ASSERT: scan Test case ended with timeout.

import std.unittest.*
import std.unittest.testmacro.*
import std.process.Process

@Test
class Tests1 {
    @Strategy[x in [ 1, 2 ]]
    func strategy(x: Int64): Int64 {
        if (x == 2) {
            sleep(Duration.second * 2)
        }
        x
    }

    @TestCase[x in strategy]
    @Timeout[Duration.second]
    func passing(x: Int64): Unit {
    }
}
