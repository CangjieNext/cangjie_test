/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args --no-color 2>&1 | compare %f

// ASSERT: scan-1 Assert Failed: @Assert[doesThrow < NoneValueException >]({ =>
// ASSERT: scan-1 └── Assert Failed: `(Unexpected exception 'Exception' in codeblock: '{ =>
// ASSERT: scan-2 throw Exception()

// ASSERT: scan-1 PASSED: 2
// ASSERT: scan-1 SKIPPED: 0
// ASSERT: scan-1 ERROR: 0
// ASSERT: scan-1 FAILED: 1
// ASSERT: scan-not SHOULD NOT RUN

import std.unittest.*
import std.unittest.testmacro.*

@CustomAssertion
func doesThrow<E>(ctx: AssertionCtx, codeblock: () -> Any): E where E <: Exception {
    try {
        codeblock()
    } catch (e: Exception) {
        if (e is AssertException || e is AssertIntermediateException) {
            throw e
        }

        if (let Some(res) <- (e as E)) {
            return res
        }
        ctx.fail("Unexpected exception '${e}' in codeblock: '${ctx.arg("codeblock")}'")
    }
    ctx.fail("Codeblock '${ctx.arg("codeblock")}' didn't raise any exception")
}

@Test
func testAutoinfer() {
    // Should accept any expection
    @Expect[doesThrow]({ => throw NoneValueException() })
}

@Test
func testCorrectExplicitType() {
    @Expect[doesThrow<NoneValueException>]({ => throw NoneValueException() })
}

@Test
func testWrongExplicitType() {
    @Assert[doesThrow<NoneValueException>]({ => throw Exception() })
    @Fail("SHOULD NOT RUN")
}
