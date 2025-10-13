/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %run %run_opt %n.%suffix %run_args

import std.random.*
import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.prop_test.*
import std.collection.*
import std.sort.SortExtension
import std.convert.*
import std.math.*

func requireEquals(lhv_: Iterable<Float64>, rhv_: Iterable<Float64>, delta!: Float64 = 1e-5, rdelta!: Float64 = 1e-6) {
    let lhv = collectArray(lhv_)
    let rhv = collectArray(rhv_)
    if (lhv.size != rhv.size) {
        eprintln("Expected ${rhv}, got ${lhv}")
        throw Exception()
    }

    for (i in 0..lhv.size) {
        let absDist = abs(lhv[i] - rhv[i])
        let totalDelta = delta + rdelta * max(abs(lhv[i]), abs(rhv[i]))
        if (absDist > totalDelta) {
            eprintln("At index ${i}: expected ${rhv[i].format("g")}, got ${lhv[i].format("g")}")
            throw Exception()
        }
    }
}

func requireEquals(lhv_: Iterable<Float32>, rhv_: Iterable<Float32>, delta!: Float32 = 1e-5, rdelta!: Float32 = 1e-6) {
    let lhv = collectArray(lhv_)
    let rhv = collectArray(rhv_)
    if (lhv.size != rhv.size) {
        eprintln("Expected ${rhv}, got ${lhv}")
        throw Exception()
    }

    for (i in 0..lhv.size) {
        let absDist = abs(lhv[i] - rhv[i])
        let totalDelta = delta + rdelta * max(abs(lhv[i]), abs(rhv[i]))
        if (absDist > totalDelta) {
            eprintln("At index ${i}: expected ${rhv[i].format("g")}, got ${lhv[i].format("g")}")
            throw Exception()
        }
    }
}

func requireEquals(lhv_: Iterable<Float16>, rhv_: Iterable<Float16>, delta!: Float16 = 1e-3, rdelta!: Float16 = 1e-2) {
    let lhv = collectArray(lhv_)
    let rhv = collectArray(rhv_)
    if (lhv.size != rhv.size) {
        eprintln("Expected ${rhv}, got ${lhv}")
        throw Exception()
    }

    for (i in 0..lhv.size) {
        let absDist = abs(lhv[i] - rhv[i])
        let totalDelta = delta + rdelta * max(abs(lhv[i]), abs(rhv[i]))
        if (absDist > totalDelta) {
            eprintln("At index ${i}: expected ${rhv[i].format("g")}, got ${lhv[i].format("g")}")
            throw Exception()
        }
    }
}

func testFloat64() {
    requireEquals(
        0.0.shrink(),
        [],
        delta: 0.0,
        rdelta: 0.0
    )

    requireEquals(
        1.0.shrink(),
        [0.0],
        delta: 0.0,
        rdelta: 0.0
    )

    requireEquals(
        Float64.NaN.shrink(),
        [0.0, 1.0],
        delta: 0.0,
        rdelta: 0.0
    )

    requireEquals(
        Float64.Inf.shrink(),
        [0.0, 1.0],
        delta: 0.0,
        rdelta: 0.0
    )

    requireEquals(
        (-Float64.Inf).shrink(),
        [0.0, 1.0],
        delta: 0.0,
        rdelta: 0.0
    )

    requireEquals(
        0.2.shrink(),
        [0.0, 1.0, 0.1],
        delta: 0.0,
        rdelta: 0.0
    )

    requireEquals(
        3.0.shrink(),
        [0.0, 1.0],
        delta: 0.0,
        rdelta: 0.0
    )

    requireEquals(
        0.1.shrink(),
        [0.0, 1.0]
    )

    requireEquals(
        3.14.shrink(),
        [
            0.0,
            1.0,
            1.57,
            3.1,
            1.5,
            3.0
        ]
    )
    requireEquals(
        3.14e10.shrink(),
        [
            0.0,
            1.0,
            3.14,
            1e10,
            3.14e5,
            1.57e10,
            3.1e10,
            1.5e10,
            3e10
        ]
    )
    requireEquals(
        13.14.shrink(),
        [
            0.0,
            1.0,
            1.314,
            10.0,
            6.57,
            13.1,
            6.5,
            13.0,
            6.0
        ]
    )
    requireEquals(
        1.314e11.shrink(),
        [
            0.0,
            1.0,
            1.314,
            1e11,
            1.314e6,
            0.657e11,
            1.31e11,
            0.65e11,
            1.3e11,
            0.6e11
        ]
    )
    requireEquals(
        123.456.shrink(),
        [
            0.0,
            1.0,
            1.23456,
            100.0,
            12.3456,
            61.728,
            61.73,
            61.7,
            123.0,
            61.0,
            120.0,
            60.0
        ]
    )
    requireEquals(
        0.00023.shrink(),
        [
            0.0,
            1.0,
            0.23,
            0.001,
            0.0023,
            0.00011,
            0.0002,
            0.0001
        ]
    )
    requireEquals(
        1e160.shrink(),
        [0.0, 1.0, 1e80]
    )
}

func testFloat32() {
    requireEquals(
        0.0f32.shrink(),
        [],
        delta: 0.0f32,
        rdelta: 0.0f32
    )

    requireEquals(
        1.0f32.shrink(),
        [0.0f32],
        delta: 0.0f32,
        rdelta: 0.0f32
    )

    requireEquals(
        Float32.NaN.shrink(),
        [0.0f32, 1.0f32],
        delta: 0.0f32,
        rdelta: 0.0f32
    )

    requireEquals(
        Float32.Inf.shrink(),
        [0.0f32, 1.0f32],
        delta: 0.0f32,
        rdelta: 0.0f32
    )

    requireEquals(
        (-Float32.Inf).shrink(),
        [0.0f32, 1.0f32],
        delta: 0.0f32,
        rdelta: 0.0f32
    )

    requireEquals(
        0.2f32.shrink(),
        [0.0f32, 1.0f32, 0.1f32],
        delta: 0.0f32,
        rdelta: 0.0f32
    )

    requireEquals(
        3.0f32.shrink(),
        [0.0f32, 1.0f32],
        delta: 0.0f32,
        rdelta: 0.0f32
    )

    requireEquals(
        0.1f32.shrink(),
        [0.0f32, 1.0f32]
    )

    requireEquals(
        3.14f32.shrink(),
        [
            0.0f32,
            1.0f32,
            1.57f32,
            3.1f32,
            1.5f32,
            3.0f32
        ]
    )
    requireEquals(
        3.14e10f32.shrink(),
        [
            0.0f32,
            1.0f32,
            3.14f32,
            1e10,
            3.14e5f32,
            1.57e10f32,
            3.1e10f32,
            1.5e10f32,
            3e10
        ]
    )
    requireEquals(
        13.14f32.shrink(),
        [
            0.0f32,
            1.0f32,
            1.314f32,
            10.0f32,
            6.57f32,
            13.1f32,
            6.5f32,
            13.0f32,
            6.0f32
        ]
    )
    requireEquals(
        1.314e11f32.shrink(),
        [
            0.0f32,
            1.0f32,
            1.314f32,
            1e11,
            1.314e6f32,
            0.657e11f32,
            1.31e11f32,
            0.65e11f32,
            1.3e11f32,
            0.6e11f32
        ]
    )
    requireEquals(
        123.456f32.shrink(),
        [
            0.0f32,
            1.0f32,
            1.23456f32,
            100.0f32,
            12.3456f32,
            61.728f32,
            61.73f32,
            61.7f32,
            123.0f32,
            61.0f32,
            120.0f32,
            60.0f32
        ]
    )
    requireEquals(
        0.00023f32.shrink(),
        [
            0.0f32,
            1.0f32,
            0.23f32,
            0.001f32,
            0.0023f32,
            0.00011f32,
            0.0002f32,
            0.0001f32
        ]
    )
    requireEquals(
        1e16f32.shrink(),
        [0.0f32, 1.0f32, 1e8]
    )
}

func testFloat16() {
    requireEquals(
        0.0f16.shrink(),
        [],
        delta: 0.0f16,
        rdelta: 0.0f16
    )

    requireEquals(
        1.0f16.shrink(),
        [0.0f16],
        delta: 0.0f16,
        rdelta: 0.0f16
    )

    requireEquals(
        Float16.NaN.shrink(),
        [0.0f16, 1.0f16],
        delta: 0.0f16,
        rdelta: 0.0f16
    )

    requireEquals(
        Float16.Inf.shrink(),
        [0.0f16, 1.0f16],
        delta: 0.0f16,
        rdelta: 0.0f16
    )

    requireEquals(
        (-Float16.Inf).shrink(),
        [0.0f16, 1.0f16],
        delta: 0.0f16,
        rdelta: 0.0f16
    )

    requireEquals(
        0.2f16.shrink(),
        [0.0f16, 1.0f16, 0.4f16],
        delta: 0.0f16,
        rdelta: 0.0f16
    )

    requireEquals(
        3.0f16.shrink(),
        [0.0f16, 1.0f16, 1.5f16],
        delta: 0.0f16,
        rdelta: 0.0f16
    )

    requireEquals(
        0.1f16.shrink(),
        [0.0f16, 1.0f16, 0.2f16]
    )

    requireEquals(
        3.14f16.shrink(),
        [
            0.0f16,
            1.0f16,
            3.0f16
        ]
    )
    requireEquals(
        3.14e4f16.shrink(),
        [
            0.0f16,
            1.0f16,
            15696.0f16
        ]
    )
    requireEquals(
        123.456f16.shrink(),
        [
            0.0f16,
            1.0f16,
            123.0f16
        ]
    )
    requireEquals(
        0.00023f16.shrink(),
        [
            0.0f16,
            1.0f16,
            0.00046f16
        ]
    )
    requireEquals(
        1e2f16.shrink(),
        [0.0f16, 1.0f16, 50.0f16],
        delta: 0.0f16
    )
}

main() {
    testFloat64()
    testFloat32()
    testFloat16()
}
