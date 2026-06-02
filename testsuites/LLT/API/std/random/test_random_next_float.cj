/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.random.*

@Test
class RandomNextFloatTest {
    @TestCase
    func floatBasicSuccess(): Unit {
        var rand: Random = Random()
        @Expect(rand.nextFloat16() is Float16)
        @Expect(rand.nextFloat32() is Float32)
        @Expect(rand.nextFloat64() is Float64)
    }

    @TestCase
    func Float64DistributionIsEven(): Unit {
        var rand: Random = Random()
        var frequency = Array<UInt32>(8, repeat: 0)
        let testCount: UInt32 = 20000000
        let maxCountPerRange: UInt32 = 2508000
        for (_ in 0..testCount) {
            let num: Float64 = rand.nextFloat64()
            match {
                case num < 0.125 => frequency[0] += 1
                case num < 0.25 => frequency[1] += 1
                case num < 0.375 => frequency[2] += 1
                case num < 0.5 => frequency[3] += 1
                case num < 0.625 => frequency[4] += 1
                case num < 0.75 => frequency[5] += 1
                case num < 0.875 => frequency[6] += 1
                case num <= 1.0 => frequency[7] += 1
                case _ => @Assert(false)
            }
        }

        @Assert(frequency[0] < maxCountPerRange)
        @Assert(frequency[1] < maxCountPerRange)
        @Assert(frequency[2] < maxCountPerRange)
        @Assert(frequency[3] < maxCountPerRange)
        @Assert(frequency[4] < maxCountPerRange)
        @Assert(frequency[5] < maxCountPerRange)
        @Assert(frequency[6] < maxCountPerRange)
        @Assert(frequency[7] < maxCountPerRange)
    }

    @TestCase
    func gaussianFloatBasicSuccess(): Unit {
        var rand: Random = Random()
        @Expect(rand.nextGaussianFloat16() is Float16)
        @Expect(rand.nextGaussianFloat16() is Float16)
        @Expect(rand.nextGaussianFloat32() is Float32)
        @Expect(rand.nextGaussianFloat32() is Float32)
        @Expect(rand.nextGaussianFloat64() is Float64)
        @Expect(rand.nextGaussianFloat64() is Float64)
    }

    @TestCase
    func gaussianFloat16DistributionIsGaussian(): Unit {
        var rand: Random = Random()
        var sum: Float32 = 0.0
        let testCount: UInt32 = 100000
        let testMean: Float16 = 5.0
        for (_ in 0..testCount) {
            sum += Float32(rand.nextGaussianFloat16(mean: testMean))
        }
        @Assert((sum / Float32(testCount)) < Float32(testMean + 0.01))
        @Assert((sum / Float32(testCount)) > -Float32(testMean + 0.01))
    }

    @TestCase
    func gaussianFloat32DistributionIsGaussian(): Unit {
        var rand: Random = Random()
        var sum: Float32 = 0.0
        let testCount: UInt32 = 100000
        let testMean: Float32 = 0.0
        let testSigma: Float32 = 1.0
        for (_ in 0..testCount) {
            sum += rand.nextGaussianFloat32(mean: testMean, sigma: testSigma)
        }
        @Assert((sum / Float32(testCount)) < (testMean + 0.01))
        @Assert((sum / Float32(testCount)) > -(testMean + 0.01))
    }

    @TestCase
    func gaussianFloat64DistributionIsGaussian(): Unit {
        var rand: Random = Random()
        var sum: Float64 = 0.0
        let testCount: UInt64 = 100000
        let testMean: Float64 = 0.0
        let testSigma: Float64 = 1.0
        for (_ in 0..testCount) {
            sum += rand.nextGaussianFloat64(mean: testMean, sigma: testSigma)
        }
        @Assert((sum / Float64(testCount)) < (testMean + 0.01))
        @Assert((sum / Float64(testCount)) > -(testMean + 0.01))
    }
}
