/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Unit tests for the internal `Measurements` OLS-regression helper used by the
// benchmarking machinery. Reaches the protected type via a `std.*` test
// package (same module as `std.unittest`); see sample_test.cj for the rationale.
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args --no-color

package std.bench_stat_test

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class MeasurementsTest {
    // Perfect positive-linear data: slope 2, intercept 0, R^2 = 1.
    @TestCase
    func olsPerfectLineThroughOrigin(): Unit {
        let m = Measurements([(0.0, 0.0), (1.0, 2.0), (2.0, 4.0), (3.0, 6.0)])
        m.calculateMean()
        @Expect(m.mainSlope, 2.0, delta: 1e-9)
        @Expect(m.intercept, 0.0, delta: 1e-9)
        @Expect(m.r2, 1.0, delta: 1e-9)
    }

    // Positive linear with non-zero intercept: slope 2, intercept 1, R^2 = 1.
    @TestCase
    func olsPerfectLineWithIntercept(): Unit {
        let m = Measurements([(0.0, 1.0), (1.0, 3.0), (2.0, 5.0)])
        m.calculateMean()
        @Expect(m.mainSlope, 2.0, delta: 1e-9)
        @Expect(m.intercept, 1.0, delta: 1e-9)
        @Expect(m.r2, 1.0, delta: 1e-9)
    }

    // Negative-slope data triggers the zero-slope/zero-intercept fallback.
    // The zero-slope model (mean of y) has lower MSE here, so mainSlope=0,
    // intercept = mean(y) = 3, and R^2 = 0.
    @TestCase
    func negativeSlopeFallsBackToZeroSlope(): Unit {
        let m = Measurements([(0.0, 5.0), (1.0, 3.0), (2.0, 1.0)])
        m.calculateMean()
        @Expect(m.mainSlope, 0.0, delta: 1e-9)
        @Expect(m.intercept, 3.0, delta: 1e-9)
        @Expect(m.r2, 0.0, delta: 1e-9)
    }

    // Constant y: slope 0, intercept = constant, sumtot = 0 so R^2 is NaN.
    @TestCase
    func constantDataYieldsNaNR2(): Unit {
        let m = Measurements([(0.0, 5.0), (1.0, 5.0), (2.0, 5.0)])
        m.calculateMean()
        @Expect(m.mainSlope, 0.0, delta: 1e-9)
        @Expect(m.intercept, 5.0, delta: 1e-9)
        @Expect(m.r2.isNaN())
    }
}
