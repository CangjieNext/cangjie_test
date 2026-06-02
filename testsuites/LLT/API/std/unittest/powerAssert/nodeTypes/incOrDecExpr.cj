/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

@Test
class RangeExprTest {
    @TestCase
    func case1() {
        var a = 2145
        var b = 534

        @PowerAssert(a-- != b++)
    }

    /* SCAN-IN
    Assert Failed: `(a-- != b++)`
                    |___|  |___|
                      ()     ()
     */
}
