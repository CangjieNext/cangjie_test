/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt 2>&1 --no-color | compare %f
// ASSERT: scan FAILED: 2

/*
 * This test checks return type of @AssertFail and @ExpectFail
 */

@Test
func assert_fail_return_type_is_nothing() {
    let f: Nothing = @Fail("")
}

@Test
func expect_fail_return_type_is_unit() {
    let f: Unit = @FailExpect("")
}
