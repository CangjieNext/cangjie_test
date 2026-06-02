/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
class SubscriptExprTest {
    let arr = [[1, 2], [5, 6], [10, 11], [100, 101]]
    @TestCase
    func testCase1() {
        @PowerAssert(arr[2][0], arr[3][1])
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}arr[2][0] == arr[3][1]{/COLOR})`
                    |___|  |  |  |   |  |  |
    [[1, 2], [5, 6],|[10, 11],|[100, 101]] |
                    |______|  |  |   |  |  |
                    [10, 11]  |  |   |  |  |
                    |_________|  |   |  |  |
                         10      |   |  |  |
                                 |___|  |  |
                 [[1, 2], [5, 6],|[10, 11],|[100, 101]]
                                 |______|  |
                                [100, 101] |
                                 |_________|
                                     101
     */
    @TestCase
    func testException() {
        @PowerAssert(arr[2][0], arr[3][2])
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}arr[2][0]{/COLOR}{COLOR=GRAY} == {/COLOR}{COLOR=YELLOW}arr[3]{/COLOR}{COLOR=RED}[2]{/COLOR})`
                    |___|  |  |  |   |  |  |
    [[1, 2], [5, 6],|[10, 11],|[100, 101]] |
                    |______|  |  |   |  |  |
                    [10, 11]  |  |   |  |  |
                    |_________|  |   |  |  |
                    |    10      |   |  |  |
                    |            |___|  |  |
                 [[1, 2], [5, 6],|[10, 11],|[100, 101]]
                    |            |______|  |
                    |           [100, 101] |
                    |            |_________|
                    |    [IndexOutOfBoundsException]
                    |______________________|
                         [not computed]
     */
}
