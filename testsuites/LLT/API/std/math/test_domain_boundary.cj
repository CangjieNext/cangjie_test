/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.math.*

/**
 * Test description: Test domain boundary checks for logBase and fmod
 * Bug fix: HIGH-02 - isEqual() uses epsilon comparison for security-critical domain checks
 * 
 * This test verifies that domain boundary checks use exact comparison instead of epsilon comparison.
 */
@Test
class DomainBoundaryTest {

    @TestCase
    func testLogBaseExactBaseOneFloat64(): Unit {
        @AssertThrows[IllegalArgumentException](logBase(10.0, 1.0))
    }

    @TestCase
    func testLogBaseNearOneFloat64(): Unit {
        @Expect(logBase(100.0, 10.0), 2.0)
        @Expect(logBase(8.0, 2.0), 3.0)
    }

    @TestCase
    func testLogBaseInvalidInputFloat64(): Unit {
        @AssertThrows[IllegalArgumentException](logBase(-1.0, 2.0))
        @AssertThrows[IllegalArgumentException](logBase(0.0, 2.0))
        @AssertThrows[IllegalArgumentException](logBase(10.0, -1.0))
        @AssertThrows[IllegalArgumentException](logBase(10.0, 0.0))
    }

    @TestCase
    func testLogBaseExactBaseOneFloat32(): Unit {
        @AssertThrows[IllegalArgumentException](logBase(Float32(10.0), Float32(1.0)))
    }

    @TestCase
    func testLogBaseNearOneFloat32(): Unit {
        @Expect(logBase(Float32(100.0), Float32(10.0)), Float32(2.0))
        @Expect(logBase(Float32(8.0), Float32(2.0)), Float32(3.0))
    }

    @TestCase
    func testLogBaseInvalidInputFloat32(): Unit {
        @AssertThrows[IllegalArgumentException](logBase(Float32(-1.0), Float32(2.0)))
        @AssertThrows[IllegalArgumentException](logBase(Float32(0.0), Float32(2.0)))
        @AssertThrows[IllegalArgumentException](logBase(Float32(10.0), Float32(-1.0)))
        @AssertThrows[IllegalArgumentException](logBase(Float32(10.0), Float32(0.0)))
    }

    @TestCase
    func testLogBaseExactBaseOneFloat16(): Unit {
        @AssertThrows[IllegalArgumentException](logBase(Float16(10.0), Float16(1.0)))
    }

    @TestCase
    func testLogBaseNearOneFloat16(): Unit {
        @Expect(logBase(Float16(100.0), Float16(10.0)), Float16(2.0))
        @Expect(logBase(Float16(8.0), Float16(2.0)), Float16(3.0))
    }

    @TestCase
    func testLogBaseInvalidInputFloat16(): Unit {
        @AssertThrows[IllegalArgumentException](logBase(Float16(-1.0), Float16(2.0)))
        @AssertThrows[IllegalArgumentException](logBase(Float16(0.0), Float16(2.0)))
        @AssertThrows[IllegalArgumentException](logBase(Float16(10.0), Float16(-1.0)))
        @AssertThrows[IllegalArgumentException](logBase(Float16(10.0), Float16(0.0)))
    }

    @TestCase
    func testFmodExactZeroDivisorFloat64(): Unit {
        @AssertThrows[IllegalArgumentException](fmod(5.0, 0.0))
        @AssertThrows[IllegalArgumentException](fmod(-5.0, 0.0))
        @AssertThrows[IllegalArgumentException](fmod(0.0, 0.0))
    }

    @TestCase
    func testFmodExactZeroDivisorFloat32(): Unit {
        @AssertThrows[IllegalArgumentException](fmod(Float32(5.0), Float32(0.0)))
        @AssertThrows[IllegalArgumentException](fmod(Float32(-5.0), Float32(0.0)))
        @AssertThrows[IllegalArgumentException](fmod(Float32(0.0), Float32(0.0)))
    }

    @TestCase
    func testFmodExactZeroDivisorFloat16(): Unit {
        @AssertThrows[IllegalArgumentException](fmod(Float16(5.0), Float16(0.0)))
        @AssertThrows[IllegalArgumentException](fmod(Float16(-5.0), Float16(0.0)))
        @AssertThrows[IllegalArgumentException](fmod(Float16(0.0), Float16(0.0)))
    }

    @TestCase
    func testFmodInfinityDividendFloat64(): Unit {
        @AssertThrows[IllegalArgumentException](fmod(Float64.Inf, 1.0))
        @AssertThrows[IllegalArgumentException](fmod(-Float64.Inf, 1.0))
    }

    @TestCase
    func testFmodInfinityDividendFloat32(): Unit {
        @AssertThrows[IllegalArgumentException](fmod(Float32.Inf, Float32(1.0)))
        @AssertThrows[IllegalArgumentException](fmod(-Float32.Inf, Float32(1.0)))
    }

    @TestCase
    func testFmodInfinityDividendFloat16(): Unit {
        @AssertThrows[IllegalArgumentException](fmod(Float16.Inf, Float16(1.0)))
        @AssertThrows[IllegalArgumentException](fmod(-Float16.Inf, Float16(1.0)))
    }

    @TestCase
    func testFmodNormalCasesFloat64(): Unit {
        @Expect(fmod(7.0, 3.0), 1.0)
        @Expect(fmod(-7.0, 3.0), -1.0)
        @Expect(fmod(7.0, -3.0), 1.0)
        @Expect(fmod(-7.0, -3.0), -1.0)
    }

    @TestCase
    func testFmodNormalCasesFloat32(): Unit {
        @Expect(fmod(Float32(7.0), Float32(3.0)), Float32(1.0))
        @Expect(fmod(Float32(-7.0), Float32(3.0)), Float32(-1.0))
        @Expect(fmod(Float32(7.0), Float32(-3.0)), Float32(1.0))
        @Expect(fmod(Float32(-7.0), Float32(-3.0)), Float32(-1.0))
    }

    @TestCase
    func testFmodNormalCasesFloat16(): Unit {
        @Expect(fmod(Float16(7.0), Float16(3.0)), Float16(1.0))
        @Expect(fmod(Float16(-7.0), Float16(3.0)), Float16(-1.0))
        @Expect(fmod(Float16(7.0), Float16(-3.0)), Float16(1.0))
        @Expect(fmod(Float16(-7.0), Float16(-3.0)), Float16(-1.0))
    }
}
