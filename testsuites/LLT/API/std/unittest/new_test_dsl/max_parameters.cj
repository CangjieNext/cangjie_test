/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*

@Test
@Configure[randomSeed: 1]
class Test_GenerationSteps {
    @TestCase[a in 0 .. 100, 
 b in 0 .. 100, 
 e in [ 1, 2 ], 
 c in [ 0, 1, 2, 3, 4 ], 
 d in [ r'a', r'b' ] 
]
    @Configure[generationSteps: 10000000]
    func case5(a: Int64, b: Int64, c: Int64, d: Rune, e: Int64): Unit {
        @Expect(a + b + 1, 1 + a + b)
    }
}
