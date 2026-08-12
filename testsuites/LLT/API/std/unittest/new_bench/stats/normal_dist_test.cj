/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// More involved tests driven by values drawn from normal distributions (using
// a fixed-seed RNG, so every dataset is deterministic and the asserted
// statistics are reproducible). Verifies that Sample/StatisticsSample and the
// bootstrap machinery recover the known properties of a normal sample
// (symmetry, mean/sigma, near-zero skewness, unimodality) and that the
// bootstrap of a noisy benchmark converges on the true per-batch cost.
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args --no-color

package std.bench_stat_test

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.ArrayList
import std.random.Random

// Fixed-seed Gaussian sampler -> deterministic dataset.
func normalSamples(n: Int64, mean: Float64, sigma: Float64, seed: UInt64): ArrayList<Float64> {
    let rng = Random(seed)
    let out = ArrayList<Float64>(n)
    for (_ in 0..n) {
        out.add(rng.nextGaussianFloat64(mean: mean, sigma: sigma))
    }
    out
}

// Models a real benchmark: batch i costs `perUnit` per iteration plus
// Gaussian measurement noise, gcCount = 0.
func normalBenchData(n: Int64, perUnit: Float64, noiseSigma: Float64, seed: UInt64): ArrayList<BenchRawMeasurement> {
    let rng = Random(seed)
    let data = ArrayList<BenchRawMeasurement>(n)
    for (i in 1..(n + 1)) {
        let noise = rng.nextGaussianFloat64(mean: 0.0, sigma: noiseSigma)
        data.add((Float64(i), perUnit * Float64(i) + noise, 0.0))
    }
    data
}

class NormalMeasurement <: Measurement {
    public func measure(): Float64 { 0.0 }
}

func normalInfo(): MeasurementInfo {
    NormalMeasurement().info
}

@Test
public class NormalSampleTest {
    // 500 draws from N(0, 5): sample mean should be near 0.
    @TestCase
    func meanConvergesToDistributionMean(): Unit {
        let s = Sample(normalSamples(500, 0.0, 5.0, 42u64))
        @Expect(s.mean(), 0.0, delta: 0.5)
    }

    @TestCase
    func stddevConvergesToDistributionSigma(): Unit {
        let s = Sample(normalSamples(500, 0.0, 5.0, 42u64))
        @Expect(s.stddev(), 5.0, delta: 0.5)
    }

    // Normal data is symmetric -> sample skewness is near zero.
    @TestCase
    func skewnessNearZeroForSymmetricData(): Unit {
        let s = Sample(normalSamples(500, 0.0, 5.0, 42u64))
        @Expect(s.skewness(), 0.0, delta: 0.4)
    }

    @TestCase
    func medianNearDistributionMean(): Unit {
        let s = Sample(normalSamples(500, 0.0, 5.0, 42u64))
        @Expect(s.percentile(0.5), 0.0, delta: 0.7)
    }

    // 2.5% / 97.5% sample percentiles should sit well beyond +/-1 sigma.
    @TestCase
    func tailsReachBeyondOneSigma(): Unit {
        let s = Sample(normalSamples(500, 0.0, 5.0, 42u64))
        @Expect(s.percentile(0.025) < -5.0)
        @Expect(s.percentile(0.975) > 5.0)
    }

    // KDE of a normal sample is unimodal with its peak near the mean.
    @TestCase
    func modeOfNormalSampleNearMean(): Unit {
        let vals = normalSamples(500, 0.0, 5.0, 42u64)
        var ss = StatisticsSample()
        for (v in vals) {
            ss.append(v)
        }
        ss.finish()
        @Expect(ss.mode, 0.0, delta: 1.5)
    }
}

@Test
public class NormalBootstrapTest {
    // Bootstrap of a noisy benchmark (per-iteration cost 100, sigma=3) must
    // recover the true per-batch cost in both median and mean.
    @TestCase
    func bootstrapRecoversPerUnitCost(): Unit {
        let data = normalBenchData(100, 100.0, 3.0, 7u64)
        let br = BenchmarkResult(data)
        br.calculate(normalInfo())
        @Expect(br.median, 100.0, delta: 1.5)
        @Expect(br.mean, 100.0, delta: 1.5)
        @Expect(br.mainResult, br.median, delta: 1e-9)
    }

    // The bootstrap median should agree with a direct per-batch estimate
    // (total / batchSize, averaged) -- the two estimators target the same
    // quantity, so they must be close.
    @TestCase
    func bootstrapMedianMatchesDirectEstimate(): Unit {
        let data = normalBenchData(100, 100.0, 3.0, 7u64)
        let perUnit = ArrayList<Float64>(data.size)
        for (x in data) {
            perUnit.add(x[1] / x[0])
        }
        let directMean = Sample(perUnit).mean()
        let br = BenchmarkResult(data)
        br.calculate(normalInfo())
        @Expect(br.median, directMean, delta: 1.5)
    }

    // Noisy data spreads the bootstrapped slope distribution, so the
    // confidence interval and error estimate are positive, while the relative
    // error stays small (well under 5% for sigma=3 around a cost of 100).
    @TestCase
    func noisyNormalDataHasSmallPositiveError(): Unit {
        let data = normalBenchData(100, 100.0, 3.0, 7u64)
        let br = BenchmarkResult(data)
        br.calculate(normalInfo())
        @Expect(br.meanCI99 > 0.0)
        @Expect(br.medianCI99 >= 0.0)
        @Expect(br.errorEst > 0.0)
        @Expect(br.errorEstPercent < 5.0)
    }
}
