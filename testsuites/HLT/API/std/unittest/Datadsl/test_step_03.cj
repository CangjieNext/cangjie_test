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
// ASSERT: scan REASON: After 201

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*

@Test
class Test_Steps {
    var count = AtomicInt64(0)

    @TestCase[x in 0 .. 201 
]
    func case1(x: Int64): Unit {
        count.fetchAdd(1)
        @Assert(x < 200)
    }

    @TestCase
    func case1_0(): Unit {
        @Expect(count.load(), 201)
    }

    @TestCase[x in 0 .. 199 
]
    func case2(x: Int64): Unit {
        @Assert(x <= 199)
    }
}
