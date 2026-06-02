/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color  2>&1 | compare %f
// ASSERT: scan PASSED: 2
// ASSERT: scan [ FAILED ] CASE: case3
// ASSERT: scan [ FAILED ] CASE: case4

import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test_Steps {
    @TestCase[x in 0 .. 1 
]
    @Configure[randomSeed: 1, generationSteps: 1, reductionSteps: 1]
    func case1(x: Int64): Unit {
        @Assert(x == 0)
    }

    @TestCase[x in [ "a" ] 
]
    @Configure[randomSeed: 1, generationSteps: 1, reductionSteps: 1]
    func case2(x: String): Unit {
        @Assert(x == "a")
    }

    @TestCase[x in 0 .. 1 
]
    @Configure[randomSeed: 1, generationSteps: 0, reductionSteps: 1]
    func case3(x: Int64): Unit {
        @Assert(x == 11)
    }

    @TestCase[x in [ "a" ] 
]
    @Configure[randomSeed: 1, generationSteps: 0, reductionSteps: 1]
    func case4(x: String): Unit {
        @Assert(x == "aa")
    }
}
