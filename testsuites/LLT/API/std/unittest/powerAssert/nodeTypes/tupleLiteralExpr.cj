/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
class TupleLiteralTest {
    func foo(arg: (Int64, Int8, String, Bool)) {
        arg
    }

    @TestCase
    func test() {
        let boo = true
        let tuple = (32, 1i8, "str str", boo)
        @PowerAssert(foo(tuple)[2], (33 - 1, 1i8, "str" + "str", !boo)[2])
    }

    // Note: Tuple does not implement ToString.
    /* SCAN-IN
    Assert Failed: `(foo(tuple)[2] == (33 - 1, 1i8, "str" + "str", !boo)[2])`
                    |_____________|  ||______|     |_____________|||___|   |
                       "str str"     |   32            "strstr"   | true   |
                                     |                            |____|   |
                                     |                             false   |
                                     |_____________________________________|
                                                     "strstr"
     */
}
