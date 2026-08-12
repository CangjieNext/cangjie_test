/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt

import std.overflow.*

/*
 * Branch-focused coverage for std.overflow wrapping_op.cj and throwing_op.cj arithmetic paths.
 */
@Test
public class OverflowWrappingThrowCoverageTest {
    @TestCase
    func testIntTypesWrappingArithmetic(): Unit {
        @Expect(Int8.Max.wrappingAdd(1), Int8.Min)
        @Expect(Int16.Max.wrappingAdd(1), Int16.Min)
        @Expect(Int32.Max.wrappingAdd(1), Int32.Min)
        @Expect(Int64.Max.wrappingAdd(1), Int64.Min)
        @Expect(Int8(1).wrappingMul(127), 127)
        @Expect(Int16(3).wrappingDiv(2), 1)
        @Expect(Int32(10).wrappingMod(3), 1)
        @Expect(Int64(5).wrappingInc(), 6)
        @Expect(Int64(5).wrappingDec(), 4)
        @Expect(Int32(5).wrappingNeg(), -5)
    }

    @TestCase
    func testUIntTypesWrappingArithmetic(): Unit {
        @Expect(UInt8.Max.wrappingAdd(1u8), 0u8)
        @Expect(UInt16.Max.wrappingAdd(1u16), 0u16)
        @Expect(UInt32.Max.wrappingAdd(1u32), 0u32)
        @Expect(UInt64.Max.wrappingAdd(1u64), 0u64)
        @Expect(UInt8(20u8).wrappingSub(10u8), 10u8)
        @Expect(UInt16(6u16).wrappingMul(7u16), 42u16)
        @Expect(UInt32(10u32).wrappingDiv(4u32), 2u32)
        @Expect(UInt64(10u64).wrappingMod(3u64), 1u64)
    }

    @TestCase
    func testWrappingShiftAllIntSizes(): Unit {
        @Expect(Int8(1).wrappingShl(7), Int8.Min)
        @Expect(Int16(1).wrappingShl(15), Int16.Min)
        @Expect(Int32(1).wrappingShl(31), Int32.Min)
        @Expect(Int64(1).wrappingShl(63), Int64.Min)
        @Expect(Int8.Min.wrappingShr(7), -1)
        @Expect(UInt8(1u8).wrappingShl(7), 0x80u8)
        @Expect(UInt32(1u32).wrappingShr(31), 0u32)
    }

    @TestCase
    func testIntTypesThrowingArithmetic(): Unit {
        @Expect(Int8(3).throwingAdd(4), 7)
        @Expect(Int16(3).throwingSub(1), 2)
        @Expect(Int32(6).throwingMul(7), 42)
        @Expect(Int64(8).throwingDiv(2), 4)
        @Expect(Int32(10).throwingMod(3), 1)
        @Expect(Int16(1).throwingInc(), 2)
        @Expect(Int16(2).throwingDec(), 1)
        @Expect(Int32(3).throwingNeg(), -3)
        @ExpectThrows[OverflowException](Int8.Max.throwingAdd(1))
        @ExpectThrows[OverflowException](Int16.Min.throwingSub(1))
        @ExpectThrows[OverflowException](Int32.Max.throwingMul(2))
    }

    @TestCase
    func testThrowingShiftAndPow(): Unit {
        @ExpectThrows[OvershiftException](Int16(1).throwingShl(16))
        @ExpectThrows[OvershiftException](UInt32(1u32).throwingShr(32))
        @Expect(Int64(2).throwingPow(10), 1024)
        @ExpectThrows[OverflowException](Int64(2).throwingPow(63))
        @Expect(Int64(3).throwingPow(3), 27)
    }

    @TestCase
    func testSaturatingDivModAcrossTypes(): Unit {
        @Expect(Int32(10).saturatingDiv(3), 3)
        @Expect(Int16(-10).saturatingMod(3), -1)
        @Expect(UInt64(100u64).saturatingDiv(7u64), 14u64)
        @Expect(UInt16(10u16).saturatingMod(4u16), 2u16)
        @Expect(Int8.Min.saturatingNeg(), Int8.Max)
        @Expect(UInt8(1u8).saturatingShl(8), UInt8(1u8) << 7)
    }
}
