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
// ASSERT: scan REASON: After 171 generation steps and 1 reduction steps

import std.unittest.*
import std.unittest.testmacro.*

@Test
@Configure[generationSteps: 4000]
class Test_ReductionSteps {
    @TestCase[x in random<String>(), 
 y in random<Int64>() 
]
    @Configure[randomSeed: 2, reductionSteps: 0]
    func case1(x: String, y: Int64): Unit {
        @Assert(x.size != y)
    }

    @TestCase[x in random<String>(), 
 y in random<Int64>() 
]
    @Configure[randomSeed: 2, reductionSteps: 1000]
    func case2(x: String, y: Int64): Unit {
        @Assert(x.size != y)
    }

    @TestCase[x in random<String>(), 
 y in random<Int64>() 
]
    @Configure[randomSeed: 2, reductionSteps: 1]
    func case3(x: String, y: Int64): Unit {
        @Assert(x.size != y)
    }
}
