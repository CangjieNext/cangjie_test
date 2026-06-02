/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan-not Expectation failed

package unittest.mock.integration

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class Example {
    var x: Int64 = 0
}

@Test
class ChangesToFieldsShouldNotBeVisibleBetweenTestCases {
    let m: Example = {
        =>
        let m = mock<Example>()
        let field = SyntheticField.create(initialValue: 0)
        @On(m.x).getsField(field)
        @On(m.x = _).setsField(field)
        m.x = 13
        @Assert(m.x, 13)
        m
    }()

    @TestCase
    func t1(): Unit {
        @Assert(m.x, 0)
        m.x = 10
        @Assert(m.x, 10)
    }

    @TestCase
    func t2(): Unit {
        @Assert(m.x, 0)
        m.x = 11
        @Assert(m.x, 11)
    }
}

/* SCAN-IN
Summary: TOTAL: 2
    PASSED: 2, SKIPPED: 0, ERROR: 0
    FAILED: 0
 */
