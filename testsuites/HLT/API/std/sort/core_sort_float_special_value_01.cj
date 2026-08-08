/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.sort.*

func orderedByComparable<T>(data: Array<T>): Bool where T <: Comparable<T> {
    for (i in 1..data.size) {
        if (data[i - 1].compare(data[i]) == Ordering.GT) {
            return false
        }
    }
    return true
}

func countMatches<T>(data: Array<T>, predicate: (T) -> Bool): Int64 {
    var count = 0
    for (value in data) {
        if (predicate(value)) {
            count++
        }
    }
    return count
}

func float16Signature(data: Array<Float16>): Array<Int64> {
    return [
        countMatches(data, {value => value.isNaN()}),
        countMatches(data, {value => value == Float16.Inf}),
        countMatches(data, {value => value == -Float16.Inf}),
        countMatches(data, {value => value.toBits() == UInt16(0)}),
        countMatches(data, {value => value.toBits() == UInt16(0x8000)}),
        countMatches(data, {value => value == -1.0}),
        countMatches(data, {value => value == 1.0})
    ]
}

func float32Signature(data: Array<Float32>): Array<Int64> {
    return [
        countMatches(data, {value => value.isNaN()}),
        countMatches(data, {value => value == Float32.Inf}),
        countMatches(data, {value => value == -Float32.Inf}),
        countMatches(data, {value => value.toBits() == UInt32(0)}),
        countMatches(data, {value => value.toBits() == UInt32(0x80000000)}),
        countMatches(data, {value => value == -1.0}),
        countMatches(data, {value => value == 1.0})
    ]
}

func float64Signature(data: Array<Float64>): Array<Int64> {
    return [
        countMatches(data, {value => value.isNaN()}),
        countMatches(data, {value => value == Float64.Inf}),
        countMatches(data, {value => value == -Float64.Inf}),
        countMatches(data, {value => value.toBits() == UInt64(0)}),
        countMatches(data, {value => value.toBits() == 0x8000000000000000u64}),
        countMatches(data, {value => value == -1.0}),
        countMatches(data, {value => value == 1.0})
    ]
}

func float16Bits(data: Array<Float16>): Array<UInt16> {
    return Array<UInt16>(data.size, {i => data[i].toBits()})
}

func float32Bits(data: Array<Float32>): Array<UInt32> {
    return Array<UInt32>(data.size, {i => data[i].toBits()})
}

func float64Bits(data: Array<Float64>): Array<UInt64> {
    return Array<UInt64>(data.size, {i => data[i].toBits()})
}

func sameMultiset<T>(left: Array<T>, right: Array<T>): Bool where T <: Equatable<T> {
    if (left.size != right.size) {
        return false
    }
    for (candidate in left) {
        var leftCount = 0
        var rightCount = 0
        for (value in left) {
            if (value == candidate) {
                leftCount++
            }
        }
        for (value in right) {
            if (value == candidate) {
                rightCount++
            }
        }
        if (leftCount != rightCount) {
            return false
        }
    }
    return true
}

func checkFloat16StableBitOrder(): Bool {
    let zeroFast = [Float16.fromBits(0x8000u16), Float16.fromBits(0u16), Float16.fromBits(0x8000u16)]
    let zeroComparator = [Float16.fromBits(0x8000u16), Float16.fromBits(0u16), Float16.fromBits(0x8000u16)]
    let nanFast = [Float16.fromBits(0x7e02u16), Float16.fromBits(0x7e01u16), Float16.fromBits(0x7e02u16)]
    let nanComparator = [Float16.fromBits(0x7e02u16), Float16.fromBits(0x7e01u16), Float16.fromBits(0x7e02u16)]
    let zeroExpected: Array<UInt16> = [0x8000, 0, 0x8000]
    let nanExpected: Array<UInt16> = [0x7e02, 0x7e01, 0x7e02]

    stableSort(zeroFast)
    stableSort(nanFast)
    sort(zeroComparator, by: {left, right => left.compare(right)}, stable: true)
    sort(nanComparator, by: {left, right => left.compare(right)}, stable: true)
    return float16Bits(zeroFast) == zeroExpected && float16Bits(zeroFast) == float16Bits(zeroComparator) &&
        float16Bits(nanFast) == nanExpected && float16Bits(nanFast) == float16Bits(nanComparator)
}

func checkFloat32StableBitOrder(): Bool {
    let zeroFast = [Float32.fromBits(0x80000000u32), Float32.fromBits(0u32), Float32.fromBits(0x80000000u32)]
    let zeroComparator = [Float32.fromBits(0x80000000u32), Float32.fromBits(0u32), Float32.fromBits(0x80000000u32)]
    let nanFast = [Float32.fromBits(0x7fc00002u32), Float32.fromBits(0x7fc00001u32), Float32.fromBits(0x7fc00002u32)]
    let nanComparator = [Float32.fromBits(0x7fc00002u32), Float32.fromBits(0x7fc00001u32),
        Float32.fromBits(0x7fc00002u32)]
    let zeroExpected: Array<UInt32> = [0x80000000, 0, 0x80000000]
    let nanExpected: Array<UInt32> = [0x7fc00002, 0x7fc00001, 0x7fc00002]

    stableSort(zeroFast)
    stableSort(nanFast)
    sort(zeroComparator, by: {left, right => left.compare(right)}, stable: true)
    sort(nanComparator, by: {left, right => left.compare(right)}, stable: true)
    return float32Bits(zeroFast) == zeroExpected && float32Bits(zeroFast) == float32Bits(zeroComparator) &&
        float32Bits(nanFast) == nanExpected && float32Bits(nanFast) == float32Bits(nanComparator)
}

func checkFloat64StableBitOrder(): Bool {
    let zeroFast = [Float64.fromBits(0x8000000000000000u64), Float64.fromBits(0u64),
        Float64.fromBits(0x8000000000000000u64)]
    let zeroComparator = [Float64.fromBits(0x8000000000000000u64), Float64.fromBits(0u64),
        Float64.fromBits(0x8000000000000000u64)]
    let nanFast = [Float64.fromBits(0x7ff8000000000002u64), Float64.fromBits(0x7ff8000000000001u64),
        Float64.fromBits(0x7ff8000000000002u64)]
    let nanComparator = [Float64.fromBits(0x7ff8000000000002u64), Float64.fromBits(0x7ff8000000000001u64),
        Float64.fromBits(0x7ff8000000000002u64)]
    let zeroExpected: Array<UInt64> = [0x8000000000000000u64, 0u64, 0x8000000000000000u64]
    let nanExpected: Array<UInt64> = [0x7ff8000000000002u64, 0x7ff8000000000001u64, 0x7ff8000000000002u64]

    stableSort(zeroFast)
    stableSort(nanFast)
    sort(zeroComparator, by: {left, right => left.compare(right)}, stable: true)
    sort(nanComparator, by: {left, right => left.compare(right)}, stable: true)
    return float64Bits(zeroFast) == zeroExpected && float64Bits(zeroFast) == float64Bits(zeroComparator) &&
        float64Bits(nanFast) == nanExpected && float64Bits(nanFast) == float64Bits(nanComparator)
}

func checkFloat16UnstableSpecialValues(): Bool {
    let data = [
        Float16.fromBits(0x7e02u16),
        Float16.Inf,
        Float16.fromBits(0x8000u16),
        Float16.fromBits(0u16),
        -Float16.Inf,
        Float16(-1.0),
        Float16(1.0),
        Float16.fromBits(0x7e01u16),
        Float16.fromBits(0x8000u16),
        Float16.fromBits(0u16)
    ]
    let beforeBits = float16Bits(data)
    unstableSort(data)
    return orderedByComparable(data) && sameMultiset(float16Bits(data), beforeBits)
}

func checkFloat32UnstableSpecialValues(): Bool {
    let data = [
        Float32.fromBits(0x7fc00002u32),
        Float32.Inf,
        Float32.fromBits(0x80000000u32),
        Float32.fromBits(0u32),
        -Float32.Inf,
        Float32(-1.0),
        Float32(1.0),
        Float32.fromBits(0x7fc00001u32),
        Float32.fromBits(0x80000000u32),
        Float32.fromBits(0u32)
    ]
    let beforeBits = float32Bits(data)
    unstableSort(data)
    return orderedByComparable(data) && sameMultiset(float32Bits(data), beforeBits)
}

func checkFloat64UnstableSpecialValues(): Bool {
    let data = [
        Float64.fromBits(0x7ff8000000000002u64),
        Float64.Inf,
        Float64.fromBits(0x8000000000000000u64),
        Float64.fromBits(0u64),
        -Float64.Inf,
        Float64(-1.0),
        Float64(1.0),
        Float64.fromBits(0x7ff8000000000001u64),
        Float64.fromBits(0x8000000000000000u64),
        Float64.fromBits(0u64)
    ]
    let beforeBits = float64Bits(data)
    unstableSort(data)
    return orderedByComparable(data) && sameMultiset(float64Bits(data), beforeBits)
}

main(): Int64 {
    var f16: Array<Float16> = [
        Float16.NaN,
        Float16.Inf,
        -0.0,
        0.0,
        -Float16.Inf,
        1.0,
        -1.0,
        Float16.NaN,
        -0.0,
        0.0
    ]
    var f32: Array<Float32> = [
        Float32.NaN,
        Float32.Inf,
        -0.0,
        0.0,
        -Float32.Inf,
        1.0,
        -1.0,
        Float32.NaN,
        -0.0,
        0.0
    ]
    var f64: Array<Float64> = [
        Float64.NaN,
        Float64.Inf,
        -0.0,
        0.0,
        -Float64.Inf,
        1.0,
        -1.0,
        Float64.NaN,
        -0.0,
        0.0
    ]
    let f16Before = float16Signature(f16)
    let f32Before = float32Signature(f32)
    let f64Before = float64Signature(f64)

    stableSort(f16)
    unstableSort(f32)
    stableSort(f64)

    if (!orderedByComparable(f16) || float16Signature(f16) != f16Before) {
        return 1
    }
    if (!orderedByComparable(f32) || float32Signature(f32) != f32Before) {
        return 2
    }
    if (!orderedByComparable(f64) || float64Signature(f64) != f64Before) {
        return 3
    }
    if (!checkFloat16StableBitOrder()) {
        return 4
    }
    if (!checkFloat32StableBitOrder()) {
        return 5
    }
    if (!checkFloat64StableBitOrder()) {
        return 6
    }
    if (!checkFloat16UnstableSpecialValues()) {
        return 7
    }
    if (!checkFloat32UnstableSpecialValues()) {
        return 8
    }
    if (!checkFloat64UnstableSpecialValues()) {
        return 9
    }
    return 0
}
