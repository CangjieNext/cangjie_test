/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan FAILED: 2
// ASSERT: scan Assert Failed: `(This error message must be printed.)`
// ASSERT: scan Expect Failed: `(This error message must be printed 2.)`

@Test
func function_assert_fail_with_message() {
    fail("This error message must be printed.")
}

@Test
func function_expect_fail_with_message() {
    failExpect("This error message must be printed 2.")
}
