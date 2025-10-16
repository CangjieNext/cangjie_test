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
@Configure[randomSeed: 0]
class IT {
    @TestCase[a in [ 1, 2, 3 ], b in [ 1, 2 ]]
    func success(a: Int64, b: Int64): Unit {
        let e = mock<Example>()
        @On(e.f(a, b)).returns("abc").once()
        @Assert(e.f(a, b), "abc")
    }

    @TestCase[a in [ 1, 2 ], b in [ 1, 2 ]]
    func failedExpectation(a: Int64, b: Int64): Unit {
        let e = mock<Example>()
        @On(e.f(_, _)).returns("abc")
        if (a + b <= 3) {
            e.f(a, b)
        }
    }
    /* SCAN-IN
    REASON: After 4 generation steps:
        a = 2
        b = 2
    with randomSeed = 0
    Expectation failed
        Too few invocations for stub e.f(_, _) declared at parametrized.cj:37.
            Required: at least once
            Actual: 0
     */
    @TestCase[a in [ 1, 2 ], b in [ 1, 2 ]]
    func verify(a: Int64, b: Int64): Unit {
        let e = mock<Example>()
        @On(e.f(_, _)).returns("abc")
        for (i in 0..a + b) {
            e.f(i, i)
        }
        Verify.ordered {
            v =>
            v
            for (j in 0..b + a) {
                v.checkThat(@Called(e.f(j, j)))
            }
        }
    }

    @TestCase[a in [ 1, 2 ], b in [ 1 ]]
    func verifyFailed(a: Int64, b: Int64): Unit {
        let e = mock<Example>()
        @On(e.f(_, _)).returns("abc")
        for (i in 0..a + b) {
            e.f(i, i)
        }
        Verify.ordered {
            v =>
            v
            for (j in 0..a) {
                v.checkThat(@Called(e.f(j, j)))
            }
        }
    }
    /* SCAN-IN
    REASON: After 1 generation steps:
        a = 1
        b = 1
    with randomSeed = 0
    Verification failed
        The following invocations were not matched by any statement:
     */
}

@Test[a in [ 1 ], b in [ 2 ]]
@Configure[randomSeed: 0]
func failedExpectation(a: Int64, b: Int64): Unit {
    let e = mock<Example>()
    @On(e.f(_, _)).returns((a + b).toString()).times(2)
    @Assert(e.f(1, 2), "3")
}
/* SCAN-IN
    REASON: After 1 generation steps:
        a = 1
        b = 2
    with randomSeed = 0
    Expectation failed
        Too few invocations for stub e.f(_, _) declared at parametrized.cj:97.
            Required: exactly 2 times
            Actual: 1
            Invocations handled by this stub occured at:
 */

/* SCAN-IN
Summary: TOTAL: 5
    PASSED: 2, SKIPPED: 0, ERROR: 0
    FAILED: 3, listed below:
 */
