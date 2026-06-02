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
// ASSERT: scan REASON: After 10 generation steps
// ASSERT: scan REASON: After 15 generation steps and 5 reduction steps
// ASSERT: scan REASON: After 5 generation steps
// ASSERT: scan REASON: After 239 generation steps

import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test_RandomSeed {
    @TestCase[x in random<String>(), 
 y in random<Int64>() 
]
    @Configure[randomSeed: 0, generationSteps: 1000]
    func seed1(x: String, y: Int64): Unit {
        @Assert(x.size != y)
    }

    @TestCase[x in random<String>(), 
 y in random<Int64>() 
]
    @Configure[randomSeed: 200, generationSteps: 1000]
    func seed2(x: String, y: Int64): Unit {
        @Assert(x.size != y)
    }

    @TestCase[x in random<String>(), 
 y in random<Int64>() 
]
    @Configure[randomSeed: 400000, generationSteps: 1000]
    func seed3(x: String, y: Int64): Unit {
        @Assert(x.size != y)
    }

    @TestCase[x in random<String>(), 
 y in random<Int64>() 
]
    @Configure[randomSeed: -10, generationSteps: 1000]
    func seed5(x: String, y: Int64): Unit {
        @Assert(x.size != y)
    }
}
