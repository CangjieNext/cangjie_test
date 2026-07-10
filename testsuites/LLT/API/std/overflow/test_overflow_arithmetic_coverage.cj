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
 * Branch-focused coverage for std.overflow *\_op.cj arithmetic paths
 * (checked / saturating / wrapping / carrying / throwing) beyond shift tests.
 */
@Test
public class OverflowArithmeticCoverageTest {
    @TestCase
    func testInt32CheckedArithmeticBranches(): Unit {
        @Expect(Int32.Max.checkedAdd(0), Some<Int32>(Int32.Max))
        @Expect(Int32.Max.checkedAdd(1), None<Int32>)
        @Expect(Int32.Min.checkedSub(1), None<Int32>)
        @Expect(Int32(6).checkedMul(7), Some<Int32>(42))
        @Expect(Int32.Max.checkedMul(2), None<Int32>)
        @Expect(Int32(10).checkedDiv(2), Some<Int32>(5))
        @ExpectThrows[ArithmeticException](Int32(10).checkedDiv(0))
        @Expect(Int32(10).checkedMod(3), Some<Int32>(1))
        @Expect(Int32(5).checkedInc(), Some<Int32>(6))
        @Expect(Int32.Max.checkedInc(), None<Int32>)
        @Expect(Int32(5).checkedDec(), Some<Int32>(4))
        @Expect(Int32.Min.checkedDec(), None<Int32>)
        @Expect(Int32(5).checkedNeg(), Some<Int32>(-5))
        @Expect(Int32.Min.checkedNeg(), None<Int32>)
    }

    @TestCase
    func testInt32SaturatingAndWrappingBranches(): Unit {
        @Expect(Int32.Max.saturatingAdd(1), Int32.Max)
        @Expect(Int32.Min.saturatingSub(1), Int32.Min)
        @Expect(Int32.Max.saturatingMul(2), Int32.Max)
        @Expect(Int32(1).saturatingInc(), 2)
        @Expect(Int32.Max.saturatingInc(), Int32.Max)

        @Expect(Int32.Max.wrappingAdd(1), Int32.Min)
        @Expect(Int32.Min.wrappingSub(1), Int32.Max)
        @Expect(Int32(100).wrappingMul(100), 10000)
        @Expect(Int32(1).wrappingInc(), 2)
        @Expect(Int32(1).wrappingNeg(), -1)
    }

    @TestCase
    func testInt32CarryingAndThrowingBranches(): Unit {
        let (c1, v1) = Int32(1).carryingAdd(2)
        @Expect(c1, false)
        @Expect(v1, 3)
        let (c2, v2) = Int32.Max.carryingAdd(1)
        @Expect(c2, true)
        @Expect(v2, Int32.Min)

        @Expect(Int32(3).throwingAdd(4), 7)
        @ExpectThrows[OverflowException](Int32.Max.throwingAdd(1))
        @ExpectThrows[OverflowException](Int32.Min.throwingSub(1))
        @ExpectThrows[OverflowException](Int32.Max.throwingMul(2))
    }

    @TestCase
    func testUInt32AndInt64OverflowBranches(): Unit {
        @Expect(UInt32.Max.checkedAdd(1u32), None)
        @Expect(UInt32.Max.saturatingAdd(1u32), UInt32.Max)
        @Expect(UInt32.Max.wrappingAdd(1u32), 0u32)
        let (carry, val) = UInt32.Max.carryingAdd(1u32)
        @Expect(carry, true)
        @Expect(val, 0u32)

        @Expect(Int64.Max.checkedAdd(0), Some<Int64>(Int64.Max))
        @Expect(Int64.Max.saturatingAdd(1), Int64.Max)
        @Expect(Int64.Max.wrappingAdd(1), Int64.Min)
        @ExpectThrows[OverflowException](Int64.Max.throwingAdd(1))
    }

    @TestCase
    func testInt16Int8AndUIntCheckedBranches(): Unit {
        @Expect(Int16.Max.checkedAdd(1), None<Int16>)
        @Expect(Int16(3).checkedMul(4), Some<Int16>(12))
        @Expect(Int8.Max.checkedInc(), None<Int8>)
        @Expect(UInt16.Max.checkedAdd(1u16), None<UInt16>)
        @Expect(UInt8(200u8).checkedSub(50u8), Some<UInt8>(150u8))
        @ExpectThrows[ArithmeticException](Int16(10).checkedDiv(0))
        @ExpectThrows[ArithmeticException](UInt32(10u32).checkedMod(0u32))
    }

    @TestCase
    func testSaturatingShiftAndWrappingUIntBranches(): Unit {
        @Expect(Int8(1).saturatingShl(8), Int8(1) << 7)
        @Expect(Int16(1).saturatingShl(16), Int16(1) << 15)
        @Expect(Int32(1).saturatingShr(32), Int32(1) >> 31)
        @Expect(UInt8.Max.wrappingAdd(1u8), 0u8)
        @Expect(UInt16.Max.wrappingMul(2u16), UInt16.Max - 1u16)
        @Expect(UInt32(1u32).wrappingShl(31), 0x8000_0000u32)
    }

    @TestCase
    func testThrowingShiftAndCheckedPowBranches(): Unit {
        @ExpectThrows[OvershiftException](Int8(1).throwingShl(8))
        @ExpectThrows[OvershiftException](Int32(1).throwingShr(32))
        @Expect(Int64(2).checkedPow(10), Some<Int64>(1024))
        @Expect(Int64(2).checkedPow(64), None<Int64>)
        let (carry, val) = Int16(100).carryingSub(50)
        @Expect(carry, false)
        @Expect(val, 50)
    }

    @TestCase
    func testInt64ThrowingAndCarryingFullOps(): Unit {
        @Expect(Int64(9).throwingDiv(3), 3)
        @Expect(Int64(9).throwingMod(4), 1)
        @Expect(Int64(4).throwingInc(), 5)
        @Expect(Int64(4).throwingDec(), 3)
        @Expect(Int64(4).throwingNeg(), -4)
        @ExpectThrows[OverflowException](Int64.Min.throwingNeg())
        let (c, v) = Int64.Max.carryingSub(1)
        @Expect(c, false)
        @Expect(v, Int64.Max - 1)
    }

    @TestCase
    func testUIntSaturatingDivModAndThrowingPow(): Unit {
        @Expect(UInt64.Max.saturatingDiv(1u64), UInt64.Max)
        @Expect(UInt64(10u64).saturatingMod(3u64), 1u64)
        @ExpectThrows[ArithmeticException](UInt32(100u32).saturatingDiv(0u32))
        @ExpectThrows[OverflowException](Int64(2).throwingPow(64))
        @Expect(Int64(3).throwingPow(4), 81)
    }

    @TestCase
    func testWrappingInt64AndNativeCarrying(): Unit {
        @Expect(Int64.Min.wrappingSub(1), Int64.Max)
        @Expect(Int64(1).wrappingShl(63), Int64.Min)
        let (c1, v1) = UInt64(5u64).carryingAdd(1u64)
        @Expect(c1, false)
        @Expect(v1, 6u64)
        @Expect(Int32.Min.saturatingNeg(), Int32.Max)
    }
}
