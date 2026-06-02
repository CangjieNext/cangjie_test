/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
class VArrayExprTest {
    @TestCase
    func case1() {
        let arr: VArray<Int64, $4> = [1, 2, 3, 4]
        @PowerAssert(arr[0].toString(), arr[2].toString())
    }

    /* SCAN-IN
    Assert Failed: `(arr[0].toString() == arr[2].toString())`
                    |______|          |  |______|          |
                    |   1             |  |   3             |
                    |_________________|  |_________________|
                            "1"                  "3"
     */
}
