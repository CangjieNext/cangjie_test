/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt --sanitizer-coverage-trace-pc-guard --sanitizer-coverage-trace-compares 
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color --coverage-guided | compare %f
// ASSERT: scan with randomSeed = 42
// ASSERT: scan Assert Failed
// ASSERT: scan lhv =
// ASSERT: scan rhv =

import std.unittest.*
import std.unittest.prop_test.*
import std.unittest.testmacro.*

@Test[lhv in randomInRange(min: 1, max: 100), rhv in random()]
@Configure[randomSeed: 42, generationSteps: 5000]
func fooTest(lhv: UInt32, rhv: UInt32): Unit {
    @Assert(lhv != rhv)
}
