/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan IllegalArgumentException: delta must be in interval [0.0, Float64.Max). Actual delta: inf.

import std.math.*

@Test
public class Test_Delta_Expect_Float64_N {
    @TestCase
    func case_01(): Unit {
        // test extreme value
        @Expect(Float64.getInf(), 1.0f64, delta: Float64.getInf())
    }
}
