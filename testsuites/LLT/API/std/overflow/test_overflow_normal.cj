/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.overflow.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class OverflowNormalTest {
    @TestCase
    func test_checked_normal_int8(): Unit {
        @Expect(Int8(5).checkedAdd(3) == Some(Int8(8)))
        @Expect(Int8(5).checkedSub(3) == Some(Int8(2)))
        @Expect(Int8(3).checkedMul(2) == Some(Int8(6)))
        @Expect(Int8(6).checkedDiv(2) == Some(Int8(3)))
        @Expect(Int8(7).checkedMod(3) == Some(Int8(1)))
        @Expect(Int8(5).checkedInc() == Some(Int8(6)))
        @Expect(Int8(5).checkedDec() == Some(Int8(4)))
        @Expect(Int8(5).checkedNeg() == Some(Int8(-5)))
    }

    @TestCase
    func test_checked_normal_int64(): Unit {
        @Expect(Int64(100).checkedAdd(200) == Some(Int64(300)))
        @Expect(Int64(100).checkedSub(50) == Some(Int64(50)))
        @Expect(Int64(3).checkedMul(4) == Some(Int64(12)))
        @Expect(Int64(10).checkedDiv(3) == Some(Int64(3)))
        @Expect(Int64(10).checkedMod(3) == Some(Int64(1)))
        @Expect(Int64(5).checkedInc() == Some(Int64(6)))
        @Expect(Int64(5).checkedDec() == Some(Int64(4)))
        @Expect(Int64(5).checkedNeg() == Some(Int64(-5)))
    }

    @TestCase
    func test_throwing_normal_int8(): Unit {
        @Expect(Int8(5).throwingAdd(3) == Int8(8))
        @Expect(Int8(5).throwingSub(3) == Int8(2))
        @Expect(Int8(3).throwingMul(2) == Int8(6))
        @Expect(Int8(6).throwingDiv(2) == Int8(3))
        @Expect(Int8(7).throwingMod(3) == Int8(1))
        @Expect(Int8(5).throwingInc() == Int8(6))
        @Expect(Int8(5).throwingDec() == Int8(4))
        @Expect(Int8(5).throwingNeg() == Int8(-5))
    }

    @TestCase
    func test_throwing_normal_int64(): Unit {
        @Expect(Int64(100).throwingAdd(200) == Int64(300))
        @Expect(Int64(100).throwingSub(50) == Int64(50))
        @Expect(Int64(3).throwingMul(4) == Int64(12))
        @Expect(Int64(10).throwingDiv(3) == Int64(3))
        @Expect(Int64(10).throwingMod(3) == Int64(1))
        @Expect(Int64(5).throwingInc() == Int64(6))
        @Expect(Int64(5).throwingDec() == Int64(4))
        @Expect(Int64(5).throwingNeg() == Int64(-5))
    }

    @TestCase
    func test_wrapping_normal_int8(): Unit {
        @Expect(Int8(5).wrappingAdd(3) == Int8(8))
        @Expect(Int8(5).wrappingSub(3) == Int8(2))
        @Expect(Int8(3).wrappingMul(2) == Int8(6))
        @Expect(Int8(6).wrappingDiv(2) == Int8(3))
        @Expect(Int8(7).wrappingMod(3) == Int8(1))
        @Expect(Int8(5).wrappingInc() == Int8(6))
        @Expect(Int8(5).wrappingDec() == Int8(4))
        @Expect(Int8(5).wrappingNeg() == Int8(-5))
    }

    @TestCase
    func test_saturating_normal_int8(): Unit {
        @Expect(Int8(5).saturatingAdd(3) == Int8(8))
        @Expect(Int8(5).saturatingSub(3) == Int8(2))
        @Expect(Int8(3).saturatingMul(2) == Int8(6))
        @Expect(Int8(6).saturatingDiv(2) == Int8(3))
        @Expect(Int8(7).saturatingMod(3) == Int8(1))
        @Expect(Int8(5).saturatingInc() == Int8(6))
        @Expect(Int8(5).saturatingDec() == Int8(4))
        @Expect(Int8(5).saturatingNeg() == Int8(-5))
    }

    @TestCase
    func test_intnative_shifts(): Unit {
        @Expect(IntNative(1).wrappingShl(1) == IntNative(2))
        @Expect(IntNative(4).wrappingShr(1) == IntNative(2))
        @Expect(IntNative(1).saturatingShl(1) == IntNative(2))
        @Expect(IntNative(4).saturatingShr(1) == IntNative(2))
        @Expect(IntNative(1).checkedShl(1) == Some(IntNative(2)))
        @Expect(IntNative(4).checkedShr(1) == Some(IntNative(2)))
        @Expect(IntNative(1).throwingShl(1) == IntNative(2))
        @Expect(IntNative(4).throwingShr(1) == IntNative(2))
    }

    @TestCase
    func test_uintnative_shifts(): Unit {
        @Expect(UIntNative(1).wrappingShl(1) == UIntNative(2))
        @Expect(UIntNative(4).wrappingShr(1) == UIntNative(2))
        @Expect(UIntNative(1).saturatingShl(1) == UIntNative(2))
        @Expect(UIntNative(4).saturatingShr(1) == UIntNative(2))
        @Expect(UIntNative(1).checkedShl(1) == Some(UIntNative(2)))
        @Expect(UIntNative(4).checkedShr(1) == Some(UIntNative(2)))
        @Expect(UIntNative(1).throwingShl(1) == UIntNative(2))
        @Expect(UIntNative(4).throwingShr(1) == UIntNative(2))
    }

    @TestCase
    func test_intnative_overshift_throwing(): Unit {
        try {
            IntNative(1).throwingShl(128)
            @Assert(false)
        } catch (e: OvershiftException) {
            @Assert(true)
        }
        try {
            UIntNative(1).throwingShr(128)
            @Assert(false)
        } catch (e: OvershiftException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_intnative_overshift_checked(): Unit {
        @Expect(IntNative(1).checkedShl(128) == None)
        @Expect(UIntNative(1).checkedShr(128) == None)
    }

    @TestCase
    func test_overshift_exception(): Unit {
        let e1 = OvershiftException()
        @Expect(e1.toString().contains("OvershiftException"))
        let e2 = OvershiftException("test msg")
        @Expect(e2.toString().contains("OvershiftException"))
        @Expect(e2.message.contains("test msg"))
    }

    @TestCase
    func test_undershift_exception(): Unit {
        let e1 = UndershiftException()
        @Expect(e1.toString().contains("UndershiftException"))
        let e2 = UndershiftException("test msg")
        @Expect(e2.toString().contains("UndershiftException"))
        @Expect(e2.message.contains("test msg"))
    }
}
