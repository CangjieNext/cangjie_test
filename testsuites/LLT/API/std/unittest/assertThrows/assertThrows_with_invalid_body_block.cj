/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %f %cmp_utest_opt -o %output 2>&1 | compare %f
// ASSERT: scan error: expected ';' or '<NL>', found ')'


@Test
func expect_throws_invalid_body() {
    @ExpectThrows({
        println())
    })
}