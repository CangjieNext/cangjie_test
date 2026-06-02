/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan  Expect Failed: `(message fail 1)`
// ASSERT: scan  Expect Failed: `(message fail 2)`

/*
 * This test checks output of failed tests.
 */

@Test
func several_expect_fails_must_be_printed() {
    @FailExpect("message fail 1")
    @FailExpect("message fail 2")
}
