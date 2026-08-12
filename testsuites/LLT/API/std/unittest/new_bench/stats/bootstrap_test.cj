/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Unit tests for the internal bootstrap machinery (`BenchmarkResult`,
// `BootstrapResult`, `SeparateGc`) used by the benchmarking machinery. Reaches
// the protected types via a `std.*` test package (same module as
// `std.unittest`); see sample_test.cj for the rationale.
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args --no-color

package std.bench_stat_test

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.ArrayList

// Builds perfectly linear benchmark measurements: (batchSize=i, total=i*slope,
// gcCount=0). For such data every bootstrap resample recovers slope `slope`
// exactly, so the resulting statistics are deterministic.
func linearData(n: Int64, slope: Float64): ArrayList<BenchRawMeasurement> {
    let data = ArrayList<BenchRawMeasurement>(n)
    for (i in 1..(n + 1)) {
        data.add((Float64(i), slope * Float64(i), 0.0))
    }
    data
}

// A minimal Measurement implementation whose `.info` property is the intended
// factory for a MeasurementInfo (the struct's own constructor is package-
// private). Using the public factory avoids widening the std.unittest API.
class TestMeasurement <: Measurement {
    public func measure(): Float64 { 0.0 }
}

func timeInfo(): MeasurementInfo {
    TestMeasurement().info
}

@Test
public class BootstrapResultTest {
    // appendStatisticsFromSample runs OLS + median regression on the subsample
    // and records the resulting slope / intercept / r^2.
    @TestCase
    func appendStatisticsFromSamplePopulatesStats(): Unit {
        let br = BootstrapResult(AllPoints)
        br.appendStatisticsFromSample(linearData(10, 10.0))
        @Expect(!br.meanStats.isEmpty())
        @Expect(br.meanStats.mean, 10.0, delta: 1e-9)
        @Expect(br.r2Stats.mean, 1.0, delta: 1e-9)
        @Expect(!br.medianStats.isEmpty())
    }

    // join merges the per-statistic sample buffers of two results.
    @TestCase
    func joinMergesStatistics(): Unit {
        let a = BootstrapResult(AllPoints)
        let b = BootstrapResult(AllPoints)
        a.appendStatisticsFromSample(linearData(10, 10.0))
        b.appendStatisticsFromSample(linearData(10, 20.0))
        a.join(b)
        // a.meanStats now holds [10.0, 20.0] -> mean 15.0
        @Expect(a.meanStats.mean, 15.0, delta: 1e-9)
    }

    // finish bootstraps the final value distribution; for perfectly linear data
    // every sampled value collapses to the slope, so resultSample.mean == slope.
    @TestCase
    func finishPopulatesResultSample(): Unit {
        let br = BootstrapResult(AllPoints)
        let raw = linearData(20, 10.0)
        br.appendStatisticsFromSample(raw)
        br.finish(raw)
        @Expect(!br.resultSample.isEmpty())
        @Expect(br.resultSample.mean, 10.0, delta: 1e-6)
    }

    // For a line through the origin the regression intercept (overhead) is 0.
    @TestCase
    func overheadNearZeroForLineThroughOrigin(): Unit {
        let br = BootstrapResult(AllPoints)
        let raw = linearData(20, 10.0)
        br.appendStatisticsFromSample(raw)
        br.finish(raw)
        @Expect(br.overhead.mean, 0.0, delta: 1e-9)
    }
}

@Test
public class BenchmarkResultTest {
    // For perfectly linear data the full bootstrap is deterministic: median,
    // mean and mainResult all equal the slope; all confidence intervals are 0.
    @TestCase
    func calculateYieldsMedianAndMeanAtSlope(): Unit {
        let br = BenchmarkResult(linearData(30, 10.0))
        br.calculate(timeInfo())
        @Expect(br.median, 10.0, delta: 1e-6)
        @Expect(br.mean, 10.0, delta: 1e-6)
        @Expect(br.mainResult, br.median, delta: 1e-9)
    }

    @TestCase
    func perfectLinearDataHasZeroConfidenceIntervals(): Unit {
        let br = BenchmarkResult(linearData(30, 10.0))
        br.calculate(timeInfo())
        @Expect(br.meanCI99, 0.0, delta: 1e-9)
        @Expect(br.medianCI99, 0.0, delta: 1e-9)
        @Expect(br.errorEst, 0.0, delta: 1e-9)
        @Expect(br.errorEstPercent, 0.0, delta: 1e-9)
    }

    // Additive noise on the measured values spreads the bootstrapped slope
    // distribution, so the confidence interval and error estimate become
    // positive while the median stays near the true slope.
    @TestCase
    func noisyDataProducesPositiveConfidenceInterval(): Unit {
        let data = ArrayList<BenchRawMeasurement>(30)
        for (i in 1..31) {
            let noise = Float64(i % 3 - 1) * 3.0
            data.add((Float64(i), 10.0 * Float64(i) + noise, 0.0))
        }
        let br = BenchmarkResult(data)
        br.calculate(timeInfo())
        @Expect(br.meanCI99 > 0.0)
        @Expect(br.errorEst > 0.0)
        @Expect(br.median > 5.0)
        @Expect(br.median < 15.0)
    }
}
