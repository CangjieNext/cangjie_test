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
class StringLiteralsQuotationMarkTest {
    /**
     * Checks that leading and trailing quotation marks presents.
     */
    @TestCase
    func test() {
        @PowerAssert("hello" + { => "a";
                "another hello"
                }(), "")
    }

    /* SCAN-IN
    Assert Failed: `("hello" + { => "a"; "another hello" }() == "")`
                    |         |_____________________________|
                    |                 "another hello"       |
                    |_______________________________________|
                               "helloanother hello"
     */
}
