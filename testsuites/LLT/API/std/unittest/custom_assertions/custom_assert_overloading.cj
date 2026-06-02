/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

// ASSERT: scan-1 Expect Failed: @Expect[overloadable](3):
// ASSERT: scan-1 └── Assert Failed: `(Overloaded with Int64 type)`
// ASSERT: scan-1 Expect Failed: @Expect[overloadable](String):
// ASSERT: scan-1 └── Assert Failed: `(Overloaded with String type)`
// ASSERT: scan-1 Expect Failed: @Expect[overloadable](v, false):
// ASSERT: scan-1 └── Assert Failed: `(Overloaded with (Int64, Bool) type)`

// ASSERT: scan-1 PASSED: 0
// ASSERT: scan-1 SKIPPED: 0
// ASSERT: scan-1 ERROR: 0
// ASSERT: scan-1 FAILED: 1
// ASSERT: scan-not SHOULD NOT RUN

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@CustomAssertion
func overloadable(ctx: AssertionCtx, v: ?Int64): Unit {
    ctx.fail("Overloaded with Int64 type")
}

@CustomAssertion
func overloadable(ctx: AssertionCtx, v: ?String): Unit {
    ctx.fail("Overloaded with String type")
}

@CustomAssertion
func overloadable(ctx: AssertionCtx, v: ?Int64, dummy: Bool): Unit {
    ctx.fail("Overloaded with (Int64, Bool) type")
}

@Test
func testAssertInsideExpect() {
    @Expect[overloadable](3)
    @Expect[overloadable]("String")
    let v = 3
    @Expect[overloadable](v, false)
}
