/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

// ASSERT: scan-1 Assert Failed: @Assert[checkNotNone](b):
// ASSERT: scan-1 └── Assert Failed: `(Expected input value to be Some(_) but got None)`

// ASSERT: scan-1 PASSED: 0
// ASSERT: scan-1 SKIPPED: 0
// ASSERT: scan-1 ERROR: 0
// ASSERT: scan-1 FAILED: 1

import std.unittest.*
import std.unittest.testmacro.*

@CustomAssertion
func checkNotNone<V>(ctx: AssertionCtx, v: ?V): Unit {
    if (v.isNone()) {
        ctx.fail("Expected input value to be Some(_) but got None")
    }
}

@Test
func test() {
    let a = 1
    let b = Option<Int64>.None
    let c = "Markov"

    @Assert[checkNotNone](a)
    @Assert[checkNotNone](b)
    @Assert[checkNotNone](c)
}
