/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan Expect Failed: `(@ExpectThrows(IllegalArgumentException))`
// ASSERT: scan expected types: IllegalArgumentException
// ASSERT: scan caught exception: IndexOutOfBoundsException
// ASSERT: scan-not Assert Failed

@Test
func expect_throws_return_None_if_other_exception_caught() {
    let e = @ExpectThrows[IllegalArgumentException](throw IndexOutOfBoundsException())

    @Assert(e is ?IllegalArgumentException)
    @Assert(e.isNone())
}
