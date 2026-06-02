/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt 2>&1 --no-color | compare %f
// ASSERT: scan Assert Failed: `(MESSAGE1)`
// ASSERT: scan expected types: EXPECTED1
// ASSERT: scan caught exception: CAUGHTEXCEPTION1
// ASSERT: scan Expect Failed: `(MESSAGE2)`
// ASSERT: scan expected types: EXPECTED2
// ASSERT: scan caught exception: CAUGHTEXCEPTION2

@Test
func function_assertCaughtUnexpectedE() {
    assertCaughtUnexpectedE("MESSAGE1", "EXPECTED1", "CAUGHTEXCEPTION1")
}

@Test
func function_expectCaughtUnexpectedE() {
    expectCaughtUnexpectedE("MESSAGE2", "EXPECTED2", "CAUGHTEXCEPTION2")
}
