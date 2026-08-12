/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Unit tests for the internal `StatisticsSample` helper (a thin wrapper over
// `Sample` used to aggregate bootstrap benchmark statistics). Reaches the
// protected type via a `std.*` test package (same module as `std.unittest`);
// see sample_test.cj for the rationale.
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args --no-color

package std.bench_stat_test

import std.unittest.*
import std.unittest.testmacro.*
import std.math.abs

@Test
public class StatisticsSampleTest {
    @TestCase
    func appendFinishThenMeanMedian(): Unit {
        var s = StatisticsSample()
        @Expect(s.isEmpty())
        s.append(1.0)
        s.append(2.0)
        s.append(3.0)
        s.append(4.0)
        s.append(5.0)
        @Expect(!s.isEmpty())
        s.finish()
        @Expect(s.mean, 3.0, delta: 1e-9)
        @Expect(s.median, 3.0, delta: 1e-9)
    }

    @TestCase
    func unsortedAppendedValuesGetSortedOnFinish(): Unit {
        var s = StatisticsSample()
        s.append(5.0)
        s.append(3.0)
        s.append(1.0)
        s.append(4.0)
        s.append(2.0)
        s.finish()
        // lowerBound/upperBound act as min/max proxies for sorted data
        @Expect(s.lowerBound, 1.5, delta: 1e-9)
        @Expect(s.upperBound, 4.5, delta: 1e-9)
    }

    @TestCase
    func nanAppendedValuesAreRemovedOnFinish(): Unit {
        var s = StatisticsSample()
        s.append(1.0)
        s.append(Float64.NaN)
        s.append(2.0)
        s.append(Float64.NaN)
        s.append(3.0)
        s.finish()
        @Expect(s.mean, 2.0, delta: 1e-9)
    }

    @TestCase
    func initWithCapacityAcceptsAppends(): Unit {
        var s = StatisticsSample(10)
        s.append(10.0)
        s.append(20.0)
        s.append(30.0)
        s.finish()
        @Expect(s.mean, 20.0, delta: 1e-9)
    }

    @TestCase
    func modeOfUnimodalClusterNearCenter(): Unit {
        var s = StatisticsSample()
        s.append(4.0)
        s.append(4.5)
        s.append(5.0)
        s.append(5.0)
        s.append(5.0)
        s.append(5.5)
        s.append(6.0)
        s.finish()
        let m = s.mode
        @Expect(m > 3.0)
        @Expect(m < 7.0)
        @Expect(m, 5.0, delta: 1.0)
    }

    @TestCase
    func mode2OfBimodalDataDiffersFromMode(): Unit {
        var s = StatisticsSample()
        // two well-separated clusters
        s.append(1.0)
        s.append(1.0)
        s.append(1.0)
        s.append(1.0)
        s.append(1.0)
        s.append(1.0)
        s.append(1.0)
        s.append(1.0)
        s.append(10.0)
        s.append(10.0)
        s.append(10.0)
        s.append(10.0)
        s.append(10.0)
        s.append(10.0)
        s.append(10.0)
        s.append(10.0)
        s.finish()
        let m1 = s.mode
        let m2 = s.mode2()
        @Expect(!m2.isNaN())
        let gap = abs(m1 - m2)
        @Expect(gap > 5.0)
    }
}
