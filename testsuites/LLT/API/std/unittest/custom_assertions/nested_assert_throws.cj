/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -Woff unused --debug-macro %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

// ASSERT: scan-1 Evaluation continued
// ASSERT: scan-1 Assert Failed: @Assert[nestedThrows]():
// ASSERT: scan-1 ├── Expect Failed: `(@ExpectThrows(NoneValueException))`
// ASSERT: scan-1 │       expected types: NoneValueException
// ASSERT: scan-1 │     caught exception: Exception
// ASSERT: scan-1 └── Assert Failed: `(@AssertThrows(NoneValueException))`
// ASSERT: scan-1           expected types: NoneValueException
// ASSERT: scan-1         caught exception: Exception

// ASSERT: scan-1 PASSED: 0
// ASSERT: scan-1 SKIPPED: 0
// ASSERT: scan-1 ERROR: 0
// ASSERT: scan-1 FAILED: 1
// ASSERT: scan-not SHOULD NOT RUN

import std.unittest.*
import std.unittest.testmacro.*

@CustomAssertion
func nestedThrows(ctx: AssertionCtx): Unit {
    @ExpectThrows[NoneValueException](throw Exception())
    println("Evaluation continued")
    @AssertThrows[NoneValueException](throw Exception())
    @Fail("SHOULD NOT RUN")
}

@Test
func test() {
    @Assert[nestedThrows]()
    @Fail("SHOULD NOT RUN")
}
