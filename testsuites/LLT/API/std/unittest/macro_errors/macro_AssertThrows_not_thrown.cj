/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan Assert Failed: `(@AssertThrows: Expected 'Exception' was not caught.)`
// ASSERT: scan FAILED: 1

@Test
func assert_throw_should_fail_the_test() {
    @AssertThrows(1)
}
