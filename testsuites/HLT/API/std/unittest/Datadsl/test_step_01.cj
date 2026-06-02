/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./empty.json
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run_stdx %output %run_utest_opt %run_args --no-color  2>&1 | compare %f
// ASSERT: scan-3 REASON: Test case body was never executed. Provided strategy has zero elements.

import std.unittest.*
import std.unittest.testmacro.*
import stdx.unittest.data.*

@Test
class Test_Steps {
    @TestCase[x in 0 .. 0, 
]
    @Configure[randomSeed: 1, generationSteps: 1, reductionSteps: 1]
    func case1(x: Int64): Unit {
        @Assert(x == 999999)
    }

    @TestCase[x in Array<String>() 
]
    @Configure[randomSeed: 1, generationSteps: 1, reductionSteps: 1]
    func case2(x: String): Unit {
        @Assert(x == "999999")
    }

    @TestCase[x in json("empty.json")]
    @Configure[randomSeed: 1, generationSteps: 1, reductionSteps: 1]
    func case3(x: String): Unit {
        @Assert(x == "999999")
    }
}
