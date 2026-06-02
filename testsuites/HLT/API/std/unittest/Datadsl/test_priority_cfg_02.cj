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
// ASSERT: scan REASON: After 60 generation steps

import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test_Combinations {
    @TestCase[x in 0 .. 100, 
]
    func case1(x: Int64): Unit {
        @Expect(x != 99)
    }

    @TestCase[x in 0 .. 100, 
]
    @Configure[randomSeed: 985, generationSteps: 60, reductionSteps: 100]
    func case2(x: Int64): Unit {
        @Expect(x != 59)
    }

    @TestCase[x in 0 .. 100, 
]
    @Configure[randomSeed: 5, generationSteps: 70, reductionSteps: 100]
    @Configure[randomSeed: 10, generationSteps: 80, reductionSteps: 100]
    func case3(x: Int64): Unit {
        @Expect(x != 69)
    }
}
