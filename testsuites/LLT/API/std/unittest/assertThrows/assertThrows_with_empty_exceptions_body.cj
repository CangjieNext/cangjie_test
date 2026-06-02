/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %f %cmp_utest_opt -o %output 2>&1 | compare %f
// ASSERT: scan-2 Invalid syntax, exception types are expected inside []. Or use macro without [].

@Test
func square_brackets_can_not_be_empty_for_expect_throws() {
    @ExpectThrows[](1)
}

@Test
func square_brackets_can_not_be_empty_for_assert_throws() {
    @AssertThrows[  ](1)
}
