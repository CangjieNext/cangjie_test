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
public class Test1 {
    @TestCase
    func playground1(): Unit {
        var expect: Array<Int64> = [1, 2, 3, 4, 5]
        var actual: Array<Int64> = [1, 2, 5, 6, 10]
        @Expect(expect, actual)
    }
    @TestCase
    func playground2(): Unit {
        var expect: Array<Int64> = [1, 2, 3, 4, 5]
        var actual: Array<Int64> = [1, 2, 5, 6]
        @Expect(expect, actual)
    }
    @TestCase
    func playground3(): Unit {
        var expect: Array<Int64> = [1, 2, 3, 4, 5]
        var actual: Array<Int64> = [1, 2, 5, 6]
        @Assert(expect, actual)
    }
}

/* SCAN-IN
    Expect Failed: 
        Different elements (left - expect, right - actual):
            [2]: 3 != 5
            [3]: 4 != 6
            [4]: 5 != 10
 */

/* SCAN-IN
    Expect Failed: 
        Different sizes: 5(expect) != 4(actual)
        Different elements (left - expect, right - actual):
            [2]: 3 != 5
            [3]: 4 != 6
 */

/* SCAN-IN
    Assert Failed: 
        Different sizes: 5(expect) != 4(actual)
        Different elements (left - expect, right - actual):
            [2]: 3 != 5
            [3]: 4 != 6
 */
