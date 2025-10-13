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
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: Absolute delta is NaN.
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: Relative delta is NaN.
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: Absolute delta must be in interval [0.0, Float64.Max). Actual delta: inf.
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: Relative delta must be in interval [0.0, Float64.Max). Actual delta: inf.
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: Absolute delta must be in interval [0.0, Float64.Max). Actual delta: -0.
// ASSERT: scan REASON: An exception has occurred:IllegalArgumentException: Relative delta must be in interval [0.0, Float64.Max). Actual delta: -0.
// ASSERT: scan PASSED: 5, SKIPPED: 0, ERROR: 8
// ASSERT: scan FAILED: 0


import std.unittest.RelativeDelta

@Test
class Test_Float64 {
    private static let defaultDelta = RelativeDelta(absolute: 0.1f64, relative: 0.02f64)

    @TestCase
    func firstIsNaN(): Unit {
        Float64.NaN.isNear(1.5f64, delta: defaultDelta)
    }

    @TestCase
    func secondIsNaN(): Unit {
        0.1f64.isNear(Float64.NaN, delta: defaultDelta)
    }

    @TestCase
    func absoluteDeltaIsNaN(): Unit {
        0.1f64.isNear(0.1f64, delta: RelativeDelta(absolute: Float64.NaN, relative: 0.02f64))
    }

    @TestCase
    func relativeDeltaIsNaN(): Unit {
        0.1f64.isNear(0.1f64, delta: RelativeDelta(absolute: 0.02f64, relative: Float64.NaN))
    }

    @TestCase // correct
    func firstIsInf(): Unit {
        Float64.Inf.isNear(1.5f64, delta: defaultDelta)
    }

    @TestCase // correct
    func secondIsInf(): Unit {
        0.1f64.isNear(Float64.Inf, delta: defaultDelta)
    }

    @TestCase
    func absoluteDeltaIsInf(): Unit {
        0.1f64.isNear(0.1f64, delta: RelativeDelta(absolute: Float64.Inf, relative: 0.1f64))
    }

    @TestCase
    func relativeDeltaIsInf(): Unit {
        0.1f64.isNear(0.1f64, delta: RelativeDelta(absolute: 0.1f64, relative: Float64.Inf))
    }

    @TestCase
    func absoluteDeltaIsNegative(): Unit {
        0.1f64.isNear(0.1f64, delta: RelativeDelta(absolute: -0.1f64, relative: 0.2f64))
    }

    @TestCase
    func relativeDeltaIsNegative(): Unit {
        0.1f64.isNear(0.1f64, delta: RelativeDelta(absolute: 0.2f64, relative: -0.1f64))
    }

    @TestCase // correct
    func absoluteDeltaIsZero(): Unit {
        0.1f64.isNear(0.1f64, delta: RelativeDelta(absolute: 0.0f64, relative: 0.1f64))
    }

    @TestCase // correct
    func relativeDeltaIsZero(): Unit {
        0.1f64.isNear(0.1f64, delta: RelativeDelta(absolute: 0.0f64, relative: 0.0f64))
    }

    @TestCase // correct
    func bothDeltasAreZero(): Unit {
        0.1f64.isNear(0.1f64, delta: RelativeDelta(absolute: 0.0f64, relative: 0.0f64))
    }

}
