/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan FAILED: 4
// ASSERT: scan Expect Failed: `(1 == 2)`
// ASSERT: scan Expect Failed: `(@ExpectThrows: Expected 'IllegalArgumentException' was not caught.)`
// ASSERT: scan Assert Failed: `(3 == 4)`
// ASSERT: scan Assert Failed: `(5 == 6)`
// ASSERT: scan Assert Failed: `(7 == 8)`
// ASSERT: scan E1 cauhght.
// ASSERT: scan E2 cauhght.

@Test
func should_not_catch_AssertException() {
    @ExpectThrows[IllegalArgumentException]({
        @Expect(1, 2)
    })
}

// outer @ExpectThrows wont be printed because of @PowerAssert fails test before
@Test
func should_not_catch_AssertIntermediateException() {
    @ExpectThrows({
        @PowerAssert(3 == 4)
    })
}

// The test fails anyway
@Test
func should_catch_AssertException_from_Assert() {
    let e = @ExpectThrows[AssertException]({
        @Assert(5, 6)
    })

    if (e.isSome()) {
        println("E1 cauhght.")
    }
}

// The test fails anyway
@Test
func should_catch_AssertException_from_Assert_2() {
    let e = @ExpectThrows[AssertException | NoneValueException]({
        @Assert(7, 8)
    })

    if (e.isSome()) {
        println("E2 cauhght.")
    }
}
