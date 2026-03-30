/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt 

@Test
class Float16IsNormalTest {
    @TestCase
    func testIsNormalPositiveOne(): Unit {
        let f = Float16(1.0)
        @Expect(f.isNormal(), true)
    }

    @TestCase
    func testIsNormalNegativeOne(): Unit {
        let f = Float16(-1.0)
        @Expect(f.isNormal(), true)
    }

    @TestCase
    func testIsNormalPositiveZero(): Unit {
        let f = Float16(0.0)
        @Expect(f.isNormal(), false)
    }

    @TestCase
    func testIsNormalNegativeZero(): Unit {
        let f = Float16(-0.0)
        @Expect(f.isNormal(), false)
    }

    @TestCase
    func testIsNormalNaN(): Unit {
        let f = Float16.NaN
        @Expect(f.isNormal(), false)
    }

    @TestCase
    func testIsNormalPositiveInfinity(): Unit {
        let f = Float16.POSITIVE_INFINITY
        @Expect(f.isNormal(), false)
    }

    @TestCase
    func testIsNormalNegativeInfinity(): Unit {
        let f = Float16.NEGATIVE_INFINITY
        @Expect(f.isNormal(), false)
    }

    @TestCase
    func testIsNormalDenormalizedMin(): Unit {
        let f = Float16.fromBits(UInt16(0x0001))
        @Expect(f.isNormal(), false)
    }

    @TestCase
    func testIsNormalDenormalizedMax(): Unit {
        let f = Float16.fromBits(UInt16(0x03FF))
        @Expect(f.isNormal(), false)
    }

    @TestCase
    func testIsNormalSmallestNormalized(): Unit {
        let f = Float16.fromBits(UInt16(0x0400))
        @Expect(f.isNormal(), true)
    }

    @TestCase
    func testIsNormalLargeValue(): Unit {
        let f = Float16(1000.0)
        @Expect(f.isNormal(), true)
    }

    @TestCase
    func testIsNormalSmallValue(): Unit {
        let f = Float16(0.001)
        @Expect(f.isNormal(), true)
    }

    @TestCase
    func testIsNormalMultipleValues(): Unit {
        let normalValues = [Float16(1.0), Float16(2.0), Float16(0.5), Float16(100.0), Float16(-1.0)]
        for (f in normalValues) {
            @Expect(f.isNormal(), true)
        }
    }

    @TestCase
    func testIsNormalNonNormalValues(): Unit {
        let nonNormalValues = [Float16(0.0), Float16.NaN, Float16.POSITIVE_INFINITY, Float16.NEGATIVE_INFINITY]
        for (f in nonNormalValues) {
            @Expect(f.isNormal(), false)
        }
    }
}
