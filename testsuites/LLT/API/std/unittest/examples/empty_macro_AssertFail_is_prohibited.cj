/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan @Fail: Fail message should be specified.
// ASSERT: scan @FailExpect: Fail message should be specified.

@Test
func empty_assert_fail() {
    @Fail()
}

@Test
func empty_expect_fail() {
    @FailExpect()
}
