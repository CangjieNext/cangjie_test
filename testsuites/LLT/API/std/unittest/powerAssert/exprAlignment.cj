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
class PowerAssertAlignmentTest {
    func foo(args: Array<String>): Bool {
        false
    }

    @TestCase
    func test1() {
        let aaa1 = ""
        let aaa2 = "a"
        let aaa3 = "ab"
        let aaa4 = "abc"
        let aaa5 = "abcd"
        let aaa6 = "abcde"
        let aaa7 = "abcdef"

        @PowerAssert(foo(aaa1, aaa2, aaa3, aaa4, aaa5, aaa6, aaa7))
    }

    /* SCAN-IN
    Assert Failed: `(foo(aaa1, aaa2, aaa3, aaa4, aaa5, aaa6, aaa7))`
                        |____||____||____||____||    ||____||    |
                          ""    "a"  "ab"  "abc"|    |"abcde"    |
                                                |____|      |____|
                                                "abcd"     "abcdef"
     */
    @TestCase
    func test2() {
        let aa1 = ""
        let aa2 = "a"
        let aa3 = "ab"
        let aa4 = "abc"
        let aa5 = "abcd"
        let aa6 = "abcde"
        let aa7 = "abcdef"

        @PowerAssert(foo(aa1, aa2, aa3, aa4, aa5, aa6, aa7))
    }

    /* SCAN-IN
    Assert Failed: `(foo(aa1, aa2, aa3, aa4, aa5, aa6, aa7))`
                        |___||___||___||   ||___||   ||___|
                          ""  "a"  "ab"|   |"abcd"   "abcdef"
                                       |___|     |___|
                                       "abc"    "abcde"
     */
}
