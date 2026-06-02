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

import std.unittest.*
import std.unittest.testmacro.*

@CustomAssertion
func obtainCalleeCtx<V>(ctx: AssertionCtx, v: ?V, t: Bool): (String, String, String, String) {
    return (ctx.args, ctx.caller, ctx.arg("v"), ctx.arg("t"))
}

@Test
func test() {
    let (args, caller, arg1, arg2) = @Assert[obtainCalleeCtx<String>]("Rieman", true)
    @Assert(args,"Rieman, true")
    @Assert(caller, "obtainCalleeCtx < String >")
    @Assert(arg1, "Rieman")
    @Assert(arg2, "true")
}
