/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan-not Expectation failed

package unittest.mock.integration

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class Example {
    func f(_: Int64, _: Int64): String {
        "a"
    }
}

@Test
class IT {
    @TestCase
    func t1(): Unit {
        let e = mock<Example>()
        @On(e.f(2, 3)).returns("abc").times(2)

        @Assert(true, false)
    }

    @TestCase
    func t2(): Unit {
        let e = mock<Example>()
        @On(e.f(2, 3)).returns("abc").times(2)

        throw Exception("custom failure")
    }
}

/* SCAN-IN
Summary: TOTAL: 2
    PASSED: 0, SKIPPED: 0, ERROR: 1
    FAILED: 1, listed below:
            TCS: IT, CASE: t1
 */

/* SCAN-IN
    Assert Failed: `(true == false)`
 */
