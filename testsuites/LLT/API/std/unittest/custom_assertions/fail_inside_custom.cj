/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

// ASSERT: scan-1 Expect Failed: @Expect[nestedFail]():
// ASSERT: scan-2 └── Assert Failed: `(Bernstein)`

// ASSERT: scan-1 Assert Failed: @Assert[nestedFail]():

// ASSERT: scan-1 Expect Failed: @Expect[nestedFailExpect]():
// ASSERT: scan-2 ├── Expect Failed: `(Euler)`
// ASSERT: scan-2 └── Assert Failed: `(SHOULD RUN)`

// ASSERT: scan-1 Assert Failed: @Assert[nestedFailExpect]():

// ASSERT: scan-1 PASSED: 0
// ASSERT: scan-1 SKIPPED: 0
// ASSERT: scan-1 ERROR: 0
// ASSERT: scan-1 FAILED: 2

import std.unittest.*
import std.unittest.testmacro.*

@CustomAssertion
func nestedFail(ctx: AssertionCtx): Unit {
    @Fail("Bernstein")
    @Fail("SHOULD NOT RUN")
}

@CustomAssertion
func nestedFailExpect(ctx: AssertionCtx): Unit {
    @FailExpect("Euler")
    @Fail("SHOULD RUN")
}

@Test
func testFail() {
    @Expect[nestedFail]()
    @Assert[nestedFail]()
}

@Test
func testFailExpect() {
    @Expect[nestedFailExpect]()
    @Assert[nestedFailExpect]()
}
