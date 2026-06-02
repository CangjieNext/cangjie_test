/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -Woff unused %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

// ASSERT: scan-1 Should run

// ASSERT: scan-1 Assert Failed: @Assert[nestedExpectThrowsExpect]():
// ASSERT: scan-1 ├── Expect Failed: "A" != "B"
// ASSERT: scan-1 │       "A": "A"
// ASSERT: scan-1 │       "B": "B"
// ASSERT: scan-1 └── Expect Failed: `(@ExpectThrows: Expected 'Exception' was not caught.)`

// ASSERT: scan-1 Assert Failed: @Assert[nestedExpectThrowsAssert]():
// ASSERT: scan-1 └── Assert Failed: "C" != "D"
// ASSERT: scan-1         "C": "C"
// ASSERT: scan-1         "D": "D"

// ASSERT: scan-1 Assert Failed: @Assert[nestedAssertThrowsExpect]():
// ASSERT: scan-1 ├── Expect Failed: "E" != "F"
// ASSERT: scan-1 │       "E": "E"
// ASSERT: scan-1 │       "F": "F"
// ASSERT: scan-1 └── Assert Failed: `(@AssertThrows: Expected 'Exception' was not caught.)`

// ASSERT: scan-1 Assert Failed: @Assert[nestedAssertThrowsAssert]():
// ASSERT: scan-1 └── Assert Failed: "G" != "H"
// ASSERT: scan-1         "G": "G"
// ASSERT: scan-1         "H": "H"

// ASSERT: scan-1 PASSED: 0
// ASSERT: scan-1 SKIPPED: 0
// ASSERT: scan-1 ERROR: 0
// ASSERT: scan-1 FAILED: 4
// ASSERT: scan-not SHOULD NOT RUN

import std.unittest.*
import std.unittest.testmacro.*

@CustomAssertion
func nestedExpectThrowsExpect(ctx: AssertionCtx): Unit {
    @ExpectThrows(@Expect("A", "B"))
    println("Should run")
}

@CustomAssertion
func nestedExpectThrowsAssert(ctx: AssertionCtx): Unit {
    @ExpectThrows(@Assert("C", "D"))
    @Fail("SHOULD NOT RUN")
}

@CustomAssertion
func nestedAssertThrowsExpect(ctx: AssertionCtx): Unit {
    @AssertThrows(@Expect("E", "F"))
    @Fail("SHOULD NOT RUN")
}

@CustomAssertion
func nestedAssertThrowsAssert(ctx: AssertionCtx): Unit {
    @AssertThrows(@Assert("G", "H"))
    @Fail("SHOULD NOT RUN")
}

@Test
func test_nEtE() {
    @Assert[nestedExpectThrowsExpect]()
}

@Test
func test_nEtA() {
    @Assert[nestedExpectThrowsAssert]()
}

@Test
func test_nAtE() {
    @Assert[nestedAssertThrowsExpect]()
}

@Test
func test_nAtA() {
    @Assert[nestedAssertThrowsAssert]()
}
