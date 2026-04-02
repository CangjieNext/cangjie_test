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
import std.math.numeric.*

/**
 * Test description: Test fmod function with infinity values
 * Bug fix: HIGH-01 - fmod() only checks positive infinity, negative infinity bypasses domain check
 */
@Test
class FmodInfinityTest {
    @TestCase
    func testFmodWithNegativeInfinityFloat64(): Unit {
        // Test: fmod(-Infinity, 1.0) should throw IllegalArgumentException
        @AssertThrows(fmod(-Float64.Inf, 1.0))
    }

    @TestCase
    func testFmodWithPositiveInfinityFloat64(): Unit {
        // Test: fmod(Infinity, 1.0) should throw IllegalArgumentException
        @AssertThrows(fmod(Float64.Inf, 1.0))
    }

    @TestCase
    func testFmodWithNegativeInfinityFloat32(): Unit {
        // Test: fmod(-Infinity, 1.0F) should throw IllegalArgumentException
        @AssertThrows(fmod(-Float32.Inf, Float32(1.0)))
    }

    @TestCase
    func testFmodWithPositiveInfinityFloat32(): Unit {
        // Test: fmod(Infinity, 1.0F) should throw IllegalArgumentException
        @AssertThrows(fmod(Float32.Inf, Float32(1.0)))
    }

    @TestCase
    func testFmodWithNegativeInfinityFloat16(): Unit {
        // Test: fmod(-Infinity, 1.0F) should throw IllegalArgumentException
        @AssertThrows(fmod(-Float16.Inf, Float16(1.0)))
    }

    @TestCase
    func testFmodWithPositiveInfinityFloat16(): Unit {
        // Test: fmod(Infinity, 1.0F) should throw IllegalArgumentException
        @AssertThrows(fmod(Float16.Inf, Float16(1.0)))
    }

    @TestCase
    func testFmodWithZeroDivisorFloat64(): Unit {
        // Test: fmod(5.0, 0.0) should throw IllegalArgumentException
        @AssertThrows(fmod(5.0, 0.0))
    }

    @TestCase
    func testFmodWithZeroDivisorFloat32(): Unit {
        // Test: fmod(5.0F, 0.0F) should throw IllegalArgumentException
        @AssertThrows(fmod(Float32(5.0), Float32(0.0)))
    }

    @TestCase
    func testFmodWithZeroDivisorFloat16(): Unit {
        // Test: fmod(5.0F, 0.0F) should throw IllegalArgumentException
        @AssertThrows(fmod(Float16(5.0), Float16(0.0)))
    }

    @TestCase
    func testFmodNormalCaseFloat64(): Unit {
        // Test: fmod(5.0, 2.0) should return 1.0
        @Expect(fmod(5.0, 2.0), 1.0)
    }

    @TestCase
    func testFmodNormalCaseFloat32(): Unit {
        // Test: fmod(5.0F, 2.0F) should return 1.0F
        @Expect(fmod(Float32(5.0), Float32(2.0)), Float32(1.0))
    }

    @TestCase
    func testFmodNormalCaseFloat16(): Unit {
        // Test: fmod(5.0F, 2.0F) should return 1.0F
        @Expect(fmod(Float16(5.0), Float16(2.0)), Float16(1.0))
    }

    @TestCase
    func testFmodNegativeResultFloat64(): Unit {
        // Test: fmod(-5.0, 2.0) should return -1.0
        @Expect(fmod(-5.0, 2.0), -1.0)
    }

    @TestCase
    func testFmodNegativeResultFloat32(): Unit {
        // Test: fmod(-5.0F, 2.0F) should return -1.0F
        @Expect(fmod(Float32(-5.0), Float32(2.0)), Float32(-1.0))
    }

    @TestCase
    func testFmodNegativeResultFloat16(): Unit {
        // Test: fmod(-5.0F, 2.0F) should return -1.0F
        @Expect(fmod(Float16(-5.0), Float16(2.0)), Float16(-1.0))
    }
}