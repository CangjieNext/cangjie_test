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
class VarDeclTest {
    @TestCase
    func case1() {
        let v = 25678
        @PowerAssert({ => 
            let x = v + 1
            var xx = x + v
            xx -= 1
            xx
        }(), v)
    }

    /* SCAN-IN
    Assert Failed: `({ => let x = v + 1; var xx = x + v; xx -= 1; xx }() == v)`
                    |            |_|   |         |_| | ||_______||__|   |  |_|
                    |           25678  |        25679| |    ()   51356  | 25678
                    |            |_____|         |   |_|                |
                    |             25679          |  25678               |
                    |                            |_____|                |
                    |                             51357                 |
                    |___________________________________________________|
                                            51356
     */
}
