/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan REASON: After 3 generation steps

import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test_DataDsl {
    @TestCase[x in [(1, "1"), (2, "2"), (3, "4") ] 
]
    func case1(x: (Int64, String)): Unit {
        var (a, b) = x
        @Assert(a.toString() == b)
    }
}
