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

internal import std.unittest.*
import std.unittest.testmacro.*
internal import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class Example {
    func f(_: Int64, _: Int64): String {
        "a"
    }
}

@Test
class IT {
    let shared = mock<Example>()

    @TestCase
    func t1(): Unit {
        @On(shared.f(_, _)).returns("1")

        @Assert(shared.f(1, 2), "1")
        @Assert(shared.f(2, 2), "1")
    }

    @TestCase
    func t2(): Unit {
        @Assert(shared.f(1, 2), "1")
    }

    @TestCase
    func t3(): Unit {
        @On(shared.f(_, _)).returns("3").once()
        @Assert(shared.f(1, 2), "3")
    }
}

/* SCAN-IN
Summary: TOTAL: 3
    PASSED: 2, SKIPPED: 0, ERROR: 0
    FAILED: 1, listed below:
            TCS: IT, CASE: t2
 */

/* SCAN-IN
    REASON: Unhandled invocation <?>.f(...) at shared_mock.cj:38.
        No stubs were specified for method f.
 */
