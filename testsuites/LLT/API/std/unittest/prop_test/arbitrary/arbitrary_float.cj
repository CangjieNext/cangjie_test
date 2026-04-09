/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

import std.collection.*
import std.random.*
import std.math.*
import std.unittest.prop_test.*

let random = Random(42)

// Remove if MathExtension-like extension added for Float** types
interface Floatable<T> {
    static func GetZero(): T
    static func GetNaN(): T
    static func GetInf(): T
    static func GetMax(): T
    static func GetMin(): T
    static func GetMinDenormal(): T
    static func GetMinNormal(): T
    func isNaN(): Bool

    operator func <(f: Float64): Bool
    operator func >(f: Float64): Bool
    operator func >=(f: Float64): Bool

    func toFloat64(): Float64

    operator func -(): T

    static func GetBitsInExponent(): Int64
}

extend Float16 <: Floatable<Float16> {
    public static func GetZero(): Float16 {
        0.0f16
    }

    public operator func <(f: Float64) {
        Float64(this) < f
    }

    public operator func >(f: Float64) {
        Float64(this) > f
    }

    public operator func >=(f: Float64) {
        Float64(this) >= f
    }

    public static func GetBitsInExponent(): Int64 {
        5
    }

    public func toFloat64() {
        Float64(this)
    }

    public static func GetNaN() {
        NaN
    }
    public static func GetInf() {
        Inf
    }
    public static func GetMax() {
        Max
    }
    public static func GetMin() {
        Min
    }
    public static func GetMinDenormal() {
        MinDenormal
    }
    public static func GetMinNormal() {
        MinNormal
    }
}

extend Float32 <: Floatable<Float32> {
    public static func GetZero(): Float32 {
        0.0f32
    }

    public operator func <(f: Float64) {
        Float64(this) < f
    }

    public operator func >(f: Float64) {
        Float64(this) > f
    }

    public operator func >=(f: Float64) {
        Float64(this) >= f
    }

    public static func GetBitsInExponent(): Int64 {
        8
    }

    public func toFloat64() {
        Float64(this)
    }

    public static func GetNaN() {
        NaN
    }
    public static func GetInf() {
        Inf
    }
    public static func GetMax() {
        Max
    }
    public static func GetMin() {
        Min
    }
    public static func GetMinDenormal() {
        MinDenormal
    }
    public static func GetMinNormal() {
        MinNormal
    }
}

extend Float64 <: Floatable<Float64> {
    public static func GetZero(): Float64 {
        0.0
    }

    public static func GetBitsInExponent(): Int64 {
        11
    }

    public func toFloat64() {
        this
    }

    public static func GetNaN() {
        NaN
    }
    public static func GetInf() {
        Inf
    }
    public static func GetMax() {
        Max
    }
    public static func GetMin() {
        Min
    }
    public static func GetMinDenormal() {
        MinDenormal
    }
    public static func GetMinNormal() {
        MinNormal
    }
}

// проверить что числа на границ экпонент генерируются
@Test
@Types[T in<Float16, Float32, Float64>]
class FloatDefault<T> where T <: Floatable<T> & Comparable<T> & Arbitrary<T> & ToString {
    private func constantName(float: T) {
        match {
            case float == T.GetMin() => "Min"
            case float == T.GetMax() => "Max"
            case float == T.GetMinDenormal() => "MinDenormal"
            case float == T.GetMinNormal() => "MinNormal"
            case float.isNaN() => "Nan"
            case float == T.GetInf() => "Inf"
            case float == -T.GetInf() => "-Inf"
            case float == T.GetZero() => "Zero"
            case float == -T.GetZero() => "-Zero"
            case _ => float.toString()
        }
    }

    private func isConstant(float: T) {
        match {
            case float == T.GetMin() || float == T.GetMax() || float == T.GetMinDenormal() || float == T.GetMinNormal() ||
                float == T.GetInf() || float == -T.GetInf() || float == T.GetZero() || float == -T.GetZero() ||
                float.isNaN() => true
            case _ => false
        }
    }

    // symmetric percent difference
    private func percentDifference(x: Int64, y: Int64) {
        let numerator = abs(Float64(x - y))

        let denominator = Float64(x + y) / 2.0

        return numerator * 100.0 / denominator
    }

    @TestCase
    func arbitrary_generate_default_float_values() {
        let defaults = [
            T.GetMin(),
            T.GetMax(),
            T.GetMinDenormal(),
            T.GetMinNormal(),
            T.GetInf(),
            -T.GetInf(),
            T.GetZero(),
            -T.GetZero(),
            T.GetNaN()
        ]

        let SIZE = 600

        let generated = Array<T>(SIZE, {_ => T.arbitrary(random).next()})
        let isInGenerated = {
            default: T => if (default.isNaN()) {
                generated |> any {t: T => t.isNaN()}
            } else {
                generated |> contains(default)
            }
        }

        for (default in defaults) {
            if (!(default |> isInGenerated)) {
                throw AssertException("Expected default float value '${constantName(default)}' was not generated")
            }
        }
    }

    @TestCase
    func float_occurs_different_ranges() {
        let SIZE = 100

        let generated = Array<T>(SIZE, {_ => T.arbitrary(random).next()})
            |> filter {f: T => !isConstant(f)}

        @Assert(generated |> any<T> { f: T => f < T.GetMinNormal()})
        @Assert(generated |> any<T> { f: T => f < -1.0})
        @Assert(generated |> any<T> { f: T => f > -1.0 && f < 0.0})
        @Assert(generated |> any<T> { f: T => f > 0.0 && f < 1.0})
        @Assert(generated |> any<T> { f: T => f > 1.0})
    }

    @TestCase
    func three_quarters_of_float_random_are_not_constants() {
        let SIZE = 10000

        let filltered = Array<T>(SIZE, {_ => T.arbitrary(random).next()})
            |> filter {f: T => !isConstant(f)}
            |> collectArray

        // 73% of all generated values are not constant
        let EXPECTED_SIZE = SIZE / 100 * 73
        if (percentDifference(EXPECTED_SIZE, filltered.size) > 20.0) {
            throw AssertException(
                "Expected that ~73% of arbitrary floats are random(not constants), " +
                    "difference = (${percentDifference(EXPECTED_SIZE, filltered.size)}%) ${filltered.size}/${SIZE}")
        }
    }

    /**
     * The longest and more precise version of the test is located in HLT.
     */
    @TestCase
    func arbitrary_produce_uniform_geometric_distribution_quick() {
        // the number of exponent values
        let expValues = 2 << (T.GetBitsInExponent() - 1)

        // (bucket start, bucket end, if any generated value get in bucket)
        let buckets = ArrayList<(Float64, Float64, Bool)>()

        // calculate buckets sizes
        buckets.add((T.GetMinDenormal().toFloat64(), T.GetMinNormal().toFloat64(), false))
        buckets.add((-T.GetMinNormal().toFloat64(), T.GetMinDenormal().toFloat64(), false))

        for (i in 1..(expValues - 1)) {
            let pow = Float64(i - ((expValues - 2) / 2))

            var start = 2.0 ** pow
            var end = 2.0 ** (pow + 1.0)

            buckets.add((start, end, false))
            buckets.add((-end, -start, false))
        }

        let SIZE = buckets.size * 2

        for (_ in 0..SIZE) {
            let next = T.arbitrary(random).next()
            if (isConstant(next)) {
                continue // skipping constants
            }

            for (i in 0..buckets.size) {
                let (start, end, _) = buckets[i]

                if (next >= start && next < end) {
                    buckets[i] = (start, end, true)
                    break
                }
            }
        }

        var bucketsMet = 0
        for ((start, end, met) in buckets) {
            if (met) {
                bucketsMet++
            }
        }

        let expectedBucketsCount = (buckets.size * 50 / 100) // for 2x size, it's expected to fill 50% of buckets
        if (bucketsMet < expectedBucketsCount) {
            throw AssertException(
                "Expected ${expectedBucketsCount} buckets to be filled with numbers, " + "but was ${bucketsMet}")
        }
    }

    /**
     * The longest and more precise version of the test is located in HLT.
     */
    @TestCase
    func imaginable_float_values_are_generated() {
        let SIZE = 500000

        let expected = HashSet<Float64>([0.25, 1.0, 1.5, 1.75, 2.0, 2.5, 4.0, 10.0, 20.0])

        for (_ in 0..SIZE) {
            let next = T.arbitrary(random).next().toFloat64()
            expected.remove(next)
        }

        if (expected.size != 0) {
            throw AssertException("Expected imaginable values was not generate ${expected.toArray()}")
        }
    }
}
