/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color | compare %f
// ASSERT: scan with randomSeed = -10

import std.unittest.*
import std.unittest.testmacro.*

@Test
@Configure[generationSteps: 400]
class Test_Randomseed {
    @TestCase[x in random<String>(), 
 y in random<Int64>() 
]
    @Configure[randomSeed: -10]
    func seed5(x: String, y: Int64): Unit {
        @Assert(x.size != y)
    }
}
