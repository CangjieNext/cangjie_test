/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

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
    let shared = mock<Example>()

    protected override func beforeAll(): Unit {
        @On(shared.f(1, _)).returns("default")

        // can't report unnecessary stub because only some test can use it
        @On(shared.f(100, 100)).returns("this never happens")
    }

    @TestCase
    func t1(): Unit {
        @Assert(shared.f(1, 2), "default")
        @On(shared.f(_, _)).returns("1").times(2)
        @Assert(shared.f(2, 2), "1")
        @Assert(shared.f(1, 2), "1")
    }

    @TestCase
    func t2(): Unit {
        @On(shared.f(1, _)).returns("2")
    }

    @TestCase
    func t3(): Unit {
        @On(shared.f(_, 1)).returns("3")
        @Assert(shared.f(2, 1), "3")
        @Assert(shared.f(1, 1), "3")
        @Assert(shared.f(1, 2), "default")
    }
}

/* SCAN-IN
Summary: TOTAL: 3
    PASSED: 2, SKIPPED: 0, ERROR: 0
    FAILED: 1, listed below:
            TCS: IT, CASE: t2
 */

/* SCAN-IN
    REASON: Expectation failed
        Too few invocations for stub shared.f(1, _) declared at shared_mock_setup.cj:45.
            Required: at least once
            Actual: 0
 */
