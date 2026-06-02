/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

// ASSERT: scan-1 PASSED: 1
// ASSERT: scan-1 SKIPPED: 0
// ASSERT: scan-1 ERROR: 0
// ASSERT: scan-1 FAILED: 0

import std.unittest.*
import std.unittest.testmacro.*

@CustomAssertion
func checkNotNone<V>(ctx: AssertionCtx, v: ?V): V {
    if (let Some(res) <- v) {
        return res
    }
    ctx.fail("Expected input value to be Some(_) but got None")
}

@Test
func test() {
    let a = 1
    let b: ?String = "Leibniz"

    @Assert(a, @Assert[checkNotNone](a))
    @Assert("Leibniz", @Assert[checkNotNone](b))
}
