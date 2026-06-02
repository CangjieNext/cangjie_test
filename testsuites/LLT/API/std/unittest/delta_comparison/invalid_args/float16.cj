/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC-1: %run %run_opt %n.%suffix %run_utest_opt %run_args
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args --no-color 2>&1 | compare %f
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: First argument is NaN.
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: Second argument is NaN.
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: delta is NaN.
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: delta must be in interval [0.0, Float16.Max). Actual delta: inf.
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: delta must be in interval [0.0, Float16.Max). Actual delta: -1.000000.
// ASSERT: scan PASSED: 3, SKIPPED: 0, ERROR: 5
// ASSERT: scan FAILED: 0


@Test
class Test_Float16 {

    @TestCase
    func firstIsNaN(): Unit {
        Float16.NaN.isNear(1.5f16, delta: 0.01f16)
    }

    @TestCase
    func secondIsNaN(): Unit {
        0.1f16.isNear(Float16.NaN, delta: 0.01f16)
    }

    @TestCase
    func deltaIsNaN(): Unit {
        0.1f16.isNear(0.1f16, delta: Float16.NaN)
    }

    @TestCase // correct
    func firstIsInf(): Unit {
        Float16.Inf.isNear(1.5f16, delta: 0.01f16)
    }

    @TestCase // correct
    func secondIsInf(): Unit {
        0.1f16.isNear(Float16.Inf, delta: 0.01f16)
    }

    @TestCase
    func deltaIsInf(): Unit {
        0.1f16.isNear(0.1f16, delta: Float16.Inf)
    }

    @TestCase
    func deltaIsNegative(): Unit {
        0.1f16.isNear(0.1f16, delta: -1.0f16)
    }

    @TestCase // correct
    func deltaIsZero(): Unit {
        0.1f16.isNear(0.1f16, delta: 0.0f16)
    }

}
