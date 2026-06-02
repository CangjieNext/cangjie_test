/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan-not REASON: After 50 generation steps

import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test_DataDsl {
    @TestCase[x in 100 .. 0: - 2 
]
    func case1(x: Int64): Unit {
        @Assert(x % 2 == 0)
    }
}
