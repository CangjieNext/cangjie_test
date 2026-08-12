/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.math.*

/**
 * Test description: edge cases for round() — sign preservation of -0.0,
 *                   banker's rounding (round half to even), Inf, NaN.
 */
@Test
class RoundEdgeTest {

    // ================================================================
    // Float64
    // ================================================================

    @TestCase
    func testRoundFloat64BankerHalfToEven(): Unit {
        // round half to even (banker's rounding)
        @Expect(round(0.5), 0.0)
        @Expect(round(1.5), 2.0)
        @Expect(round(2.5), 2.0)
        @Expect(round(3.5), 4.0)
        @Expect(round(-0.5), -0.0)
        @Expect(round(-1.5), -2.0)
        @Expect(round(-2.5), -2.0)
        @Expect(round(-3.5), -4.0)
    }

    @TestCase
    func testRoundFloat64Regular(): Unit {
        // regular rounding (not halfway)
        @Expect(round(2.4), 2.0)
        @Expect(round(2.6), 3.0)
        @Expect(round(-2.4), -2.0)
        @Expect(round(-2.6), -3.0)
    }

    @TestCase
    func testRoundFloat64ZeroSign(): Unit {
        // -0.0 must remain -0.0 (sign bit preserved)
        @Expect(round(-0.0).toBits() == (-0.0).toBits())
        // +0.0 must remain +0.0
        @Expect(round(0.0).toBits() == (0.0).toBits())
    }

    @TestCase
    func testRoundFloat64Inf(): Unit {
        @Expect(round(Float64.Inf) == Float64.Inf)
        @Expect(round(-Float64.Inf) == -Float64.Inf)
    }

    // ================================================================
    // Float32
    // ================================================================

    @TestCase
    func testRoundFloat32BankerHalfToEven(): Unit {
        @Expect(round(Float32(0.5)), Float32(0.0))
        @Expect(round(Float32(1.5)), Float32(2.0))
        @Expect(round(Float32(2.5)), Float32(2.0))
        @Expect(round(Float32(3.5)), Float32(4.0))
        @Expect(round(Float32(-0.5)), Float32(-0.0))
        @Expect(round(Float32(-1.5)), Float32(-2.0))
        @Expect(round(Float32(-2.5)), Float32(-2.0))
        @Expect(round(Float32(-3.5)), Float32(-4.0))
    }

    @TestCase
    func testRoundFloat32Regular(): Unit {
        @Expect(round(Float32(2.4)), Float32(2.0))
        @Expect(round(Float32(2.6)), Float32(3.0))
        @Expect(round(Float32(-2.4)), Float32(-2.0))
        @Expect(round(Float32(-2.6)), Float32(-3.0))
    }

    @TestCase
    func testRoundFloat32ZeroSign(): Unit {
        @Expect(round(Float32(-0.0)).toBits() == Float32(-0.0).toBits())
        @Expect(round(Float32(0.0)).toBits() == Float32(0.0).toBits())
    }

    @TestCase
    func testRoundFloat32Inf(): Unit {
        @Expect(round(Float32.Inf) == Float32.Inf)
        @Expect(round(-Float32.Inf) == -Float32.Inf)
    }

    // ================================================================
    // Float16
    // ================================================================

    @TestCase
    func testRoundFloat16BankerHalfToEven(): Unit {
        @Expect(round(Float16(0.5)), Float16(0.0))
        @Expect(round(Float16(1.5)), Float16(2.0))
        @Expect(round(Float16(2.5)), Float16(2.0))
        @Expect(round(Float16(3.5)), Float16(4.0))
        @Expect(round(Float16(-0.5)), Float16(-0.0))
        @Expect(round(Float16(-1.5)), Float16(-2.0))
        @Expect(round(Float16(-2.5)), Float16(-2.0))
        @Expect(round(Float16(-3.5)), Float16(-4.0))
    }

    @TestCase
    func testRoundFloat16Regular(): Unit {
        @Expect(round(Float16(2.4)), Float16(2.0))
        @Expect(round(Float16(2.6)), Float16(3.0))
        @Expect(round(Float16(-2.4)), Float16(-2.0))
        @Expect(round(Float16(-2.6)), Float16(-3.0))
    }

    @TestCase
    func testRoundFloat16ZeroSign(): Unit {
        @Expect(round(Float16(-0.0)).toBits() == Float16(-0.0).toBits())
        @Expect(round(Float16(0.0)).toBits() == Float16(0.0).toBits())
    }

    @TestCase
    func testRoundFloat16Inf(): Unit {
        @Expect(round(Float16.Inf) == Float16.Inf)
        @Expect(round(-Float16.Inf) == -Float16.Inf)
    }
}
