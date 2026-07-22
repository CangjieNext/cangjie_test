/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.overflow.*
import std.math.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class OverflowBranchTest {

    // ===================== IntNative/UIntNative wrapping shift =====================

    @TestCase
    func testIntNativeWrappingShlBothBranches(): Unit {
        // isNative64 == true on x86_64: y >= 64 branch
        @Expect(IntNative(1).wrappingShl(UInt64(0)), 1)
        @Expect(IntNative(1).wrappingShl(UInt64(1)), 2)
        @Expect(IntNative(1).wrappingShl(UInt64(63)), IntNative.Min)
        // y >= 64: wrapping via mask
        @Expect(IntNative(1).wrappingShl(UInt64(64)), 1)
        @Expect(IntNative(1).wrappingShl(UInt64(65)), 2)
        @Expect(IntNative(1).wrappingShl(UInt64(127)), IntNative.Min)
    }

    @TestCase
    func testIntNativeWrappingShrBothBranches(): Unit {
        // nativeShiftConfig path: y >= nativeWidth
        @Expect(IntNative.Min.wrappingShr(UInt64(0)), IntNative.Min)
        @Expect(IntNative.Min.wrappingShr(UInt64(1)), IntNative.Min >> 1)
        @Expect(IntNative(-1).wrappingShr(UInt64(63)), -1)
        // y >= nativeWidth: wrapping via mask
        @Expect(IntNative.Min.wrappingShr(UInt64(64)), IntNative.Min)
        @Expect(IntNative(1).wrappingShr(UInt64(64)), 1)
        @Expect(IntNative(-1).wrappingShr(UInt64(127)), -1)
    }

    @TestCase
    func testUIntNativeWrappingShlBothBranches(): Unit {
        @Expect(UIntNative(1).wrappingShl(UInt64(0)), 1)
        @Expect(UIntNative(1).wrappingShl(UInt64(1)), 2)
        @Expect(UIntNative(1).wrappingShl(UInt64(63)), UIntNative(1) << UInt64(63))
        @Expect(UIntNative(1).wrappingShl(UInt64(64)), 1)
        @Expect(UIntNative(1).wrappingShl(UInt64(65)), 2)
        @Expect(UIntNative(1).wrappingShl(UInt64(127)), UIntNative(1) << UInt64(63))
    }

    @TestCase
    func testUIntNativeWrappingShrBothBranches(): Unit {
        @Expect(UIntNative.Max.wrappingShr(UInt64(0)), UIntNative.Max)
        @Expect(UIntNative.Max.wrappingShr(UInt64(1)), UIntNative.Max >> 1)
        @Expect(UIntNative.Max.wrappingShr(UInt64(63)), 1)
        @Expect(UIntNative.Max.wrappingShr(UInt64(64)), UIntNative.Max)
        @Expect(UIntNative(1).wrappingShr(UInt64(64)), 1)
        @Expect(UIntNative.Max.wrappingShr(UInt64(127)), 1)
    }

    // ===================== IntNative/UIntNative saturating shift =====================

    @TestCase
    func testIntNativeSaturatingShlBothBranches(): Unit {
        // y > maxShift (63) branch
        @Expect(IntNative(1).saturatingShl(UInt64(0)), 1)
        @Expect(IntNative(1).saturatingShl(UInt64(1)), 2)
        @Expect(IntNative(1).saturatingShl(UInt64(63)), IntNative.Min)
        // y > maxShift: saturate to this << maxShift
        @Expect(IntNative(1).saturatingShl(UInt64(64)), IntNative.Min)
        @Expect(IntNative(1).saturatingShl(UInt64(100)), IntNative.Min)
        @Expect(IntNative(1).saturatingShl(UInt64(128)), IntNative.Min)
    }

    @TestCase
    func testIntNativeSaturatingShrBothBranches(): Unit {
        @Expect(IntNative.Min.saturatingShr(UInt64(0)), IntNative.Min)
        @Expect(IntNative.Min.saturatingShr(UInt64(1)), IntNative.Min >> 1)
        @Expect(IntNative(-1).saturatingShr(UInt64(63)), -1)
        // y > maxShift: saturate to this >> maxShift
        @Expect(IntNative.Min.saturatingShr(UInt64(64)), -1)
        @Expect(IntNative(-1).saturatingShr(UInt64(100)), -1)
        @Expect(IntNative(0).saturatingShr(UInt64(64)), 0)
    }

    @TestCase
    func testUIntNativeSaturatingShlBothBranches(): Unit {
        @Expect(UIntNative(1).saturatingShl(UInt64(0)), 1)
        @Expect(UIntNative(1).saturatingShl(UInt64(1)), 2)
        @Expect(UIntNative(1).saturatingShl(UInt64(63)), UIntNative(1) << UInt64(63))
        // y > maxShift
        @Expect(UIntNative(1).saturatingShl(UInt64(64)), UIntNative(1) << UInt64(63))
        @Expect(UIntNative(1).saturatingShl(UInt64(100)), UIntNative(1) << UInt64(63))
    }

    @TestCase
    func testUIntNativeSaturatingShrBothBranches(): Unit {
        @Expect(UIntNative.Max.saturatingShr(UInt64(0)), UIntNative.Max)
        @Expect(UIntNative.Max.saturatingShr(UInt64(1)), UIntNative.Max >> 1)
        @Expect(UIntNative.Max.saturatingShr(UInt64(63)), 1)
        // y > maxShift
        @Expect(UIntNative.Max.saturatingShr(UInt64(64)), 1)
        @Expect(UIntNative.Max.saturatingShr(UInt64(100)), 1)
        @Expect(UIntNative(0).saturatingShr(UInt64(64)), 0)
    }

    // ===================== IntNative/UIntNative checked shift =====================

    @TestCase
    func testIntNativeCheckedShlBothBranches(): Unit {
        // y < bitWidth: Some(result)
        @Expect(IntNative(1).checkedShl(UInt64(0)), IntNative(1))
        @Expect(IntNative(1).checkedShl(UInt64(1)), IntNative(2))
        @Expect(IntNative(1).checkedShl(UInt64(63)), IntNative.Min)
        // y >= bitWidth: None
        @Expect(IntNative(1).checkedShl(UInt64(64)), None)
        @Expect(IntNative(1).checkedShl(UInt64(100)), None)
    }

    @TestCase
    func testIntNativeCheckedShrBothBranches(): Unit {
        @Expect(IntNative.Min.checkedShr(UInt64(0)), IntNative.Min)
        @Expect(IntNative.Min.checkedShr(UInt64(1)), IntNative.Min >> 1)
        @Expect(IntNative(-1).checkedShr(UInt64(63)), IntNative(-1))
        @Expect(IntNative(-1).checkedShr(UInt64(64)), None)
        @Expect(IntNative(1).checkedShr(UInt64(100)), None)
    }

    @TestCase
    func testUIntNativeCheckedShlBothBranches(): Unit {
        @Expect(UIntNative(1).checkedShl(UInt64(0)), UIntNative(1))
        @Expect(UIntNative(1).checkedShl(UInt64(1)), UIntNative(2))
        @Expect(UIntNative(1).checkedShl(UInt64(63)), UIntNative(1) << UInt64(63))
        @Expect(UIntNative(1).checkedShl(UInt64(64)), None)
        @Expect(UIntNative(1).checkedShl(UInt64(100)), None)
    }

    @TestCase
    func testUIntNativeCheckedShrBothBranches(): Unit {
        @Expect(UIntNative.Max.checkedShr(UInt64(0)), UIntNative.Max)
        @Expect(UIntNative.Max.checkedShr(UInt64(1)), UIntNative.Max >> 1)
        @Expect(UIntNative.Max.checkedShr(UInt64(63)), UIntNative(1))
        @Expect(UIntNative.Max.checkedShr(UInt64(64)), None)
        @Expect(UIntNative(1).checkedShr(UInt64(100)), None)
    }

    // ===================== IntNative/UIntNative throwing shift =====================

    @TestCase
    func testIntNativeThrowingShlBothBranches(): Unit {
        // success path: y < 64 (on 64-bit)
        @Expect(IntNative(1).throwingShl(UInt64(0)), 1)
        @Expect(IntNative(1).throwingShl(UInt64(1)), 2)
        @Expect(IntNative(1).throwingShl(UInt64(63)), IntNative.Min)
        // throw path: y >= 64
        try {
            IntNative(1).throwingShl(UInt64(64))
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
        try {
            IntNative(1).throwingShl(UInt64(100))
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func testIntNativeThrowingShrBothBranches(): Unit {
        @Expect(IntNative.Min.throwingShr(UInt64(0)), IntNative.Min)
        @Expect(IntNative.Min.throwingShr(UInt64(1)), IntNative.Min >> 1)
        @Expect(IntNative(-1).throwingShr(UInt64(63)), IntNative(-1))
        try {
            IntNative.Min.throwingShr(UInt64(64))
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
        try {
            IntNative(1).throwingShr(UInt64(100))
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func testUIntNativeThrowingShlBothBranches(): Unit {
        @Expect(UIntNative(1).throwingShl(UInt64(0)), 1)
        @Expect(UIntNative(1).throwingShl(UInt64(1)), 2)
        @Expect(UIntNative(1).throwingShl(UInt64(63)), UIntNative(1) << UInt64(63))
        try {
            UIntNative(1).throwingShl(UInt64(64))
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
        try {
            UIntNative(1).throwingShl(UInt64(100))
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func testUIntNativeThrowingShrBothBranches(): Unit {
        @Expect(UIntNative.Max.throwingShr(UInt64(0)), UIntNative.Max)
        @Expect(UIntNative.Max.throwingShr(UInt64(1)), UIntNative.Max >> 1)
        @Expect(UIntNative.Max.throwingShr(UInt64(63)), 1)
        try {
            UIntNative.Max.throwingShr(UInt64(64))
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
        try {
            UIntNative(1).throwingShr(UInt64(100))
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    // ===================== OvershiftException no-arg init =====================

    @TestCase
    func testOvershiftExceptionNoArgInit(): Unit {
        let e = OvershiftException()
        @Expect(e.message, "")
    }

    @TestCase
    func testOvershiftExceptionWithMessage(): Unit {
        let e = OvershiftException("test overshift")
        @Expect(e.message, "test overshift")
    }

    @TestCase
    func testOvershiftExceptionClassName(): Unit {
        let e = OvershiftException()
        // Ensure the no-arg init path is exercised
        try {
            throw e
            @Expect(false)
        } catch (ex: OvershiftException) {
            @Expect(ex.message, "")
        }
    }

    // ===================== UndershiftException all paths =====================

    @TestCase
    func testUndershiftExceptionNoArgInit(): Unit {
        let e = UndershiftException()
        @Expect(e.message, "")
    }

    @TestCase
    func testUndershiftExceptionWithMessage(): Unit {
        let e = UndershiftException("test undershift")
        @Expect(e.message, "test undershift")
    }

    @TestCase
    func testUndershiftExceptionThrowAndCatch(): Unit {
        try {
            throw UndershiftException()
            @Expect(false)
        } catch (e: UndershiftException) {
            @Expect(e.message, "")
        }
        try {
            throw UndershiftException("undershift msg")
            @Expect(false)
        } catch (e: UndershiftException) {
            @Expect(e.message, "undershift msg")
        }
    }

    // ===================== OverflowException no-arg init =====================

    @TestCase
    func testOverflowExceptionNoArgInit(): Unit {
        let e = OverflowException()
        @Expect(e.message, "")
    }

    @TestCase
    func testOverflowExceptionWithMessage(): Unit {
        let e = OverflowException("overflow occurred")
        @Expect(e.message, "overflow occurred")
    }

    @TestCase
    func testOverflowExceptionThrowAndCatch(): Unit {
        try {
            throw OverflowException()
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "")
        }
        try {
            throw OverflowException("thrown overflow")
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message, "thrown overflow")
        }
    }

    // ===================== Checked arithmetic - success paths =====================

    @TestCase
    func testCheckedAddSuccess(): Unit {
        @Expect(Int8(5).checkedAdd(3), Int8(8))
        @Expect(Int16(5).checkedAdd(3), Int16(8))
        @Expect(Int32(5).checkedAdd(3), Int32(8))
        @Expect(Int64(5).checkedAdd(3), Int64(8))
        @Expect(IntNative(5).checkedAdd(3), IntNative(8))
        @Expect(UInt8(5).checkedAdd(3), UInt8(8))
        @Expect(UInt16(5).checkedAdd(3), UInt16(8))
        @Expect(UInt32(5).checkedAdd(3), UInt32(8))
        @Expect(UInt64(5).checkedAdd(3), UInt64(8))
        @Expect(UIntNative(5).checkedAdd(3), UIntNative(8))
    }

    @TestCase
    func testCheckedSubSuccess(): Unit {
        @Expect(Int8(5).checkedSub(3), Int8(2))
        @Expect(Int16(5).checkedSub(3), Int16(2))
        @Expect(Int32(5).checkedSub(3), Int32(2))
        @Expect(Int64(5).checkedSub(3), Int64(2))
        @Expect(IntNative(5).checkedSub(3), IntNative(2))
        @Expect(UInt8(5).checkedSub(3), UInt8(2))
        @Expect(UInt16(5).checkedSub(3), UInt16(2))
        @Expect(UInt32(5).checkedSub(3), UInt32(2))
        @Expect(UInt64(5).checkedSub(3), UInt64(2))
        @Expect(UIntNative(5).checkedSub(3), UIntNative(2))
    }

    @TestCase
    func testCheckedMulSuccess(): Unit {
        @Expect(Int8(3).checkedMul(4), Int8(12))
        @Expect(Int16(3).checkedMul(4), Int16(12))
        @Expect(Int32(3).checkedMul(4), Int32(12))
        @Expect(Int64(3).checkedMul(4), Int64(12))
        @Expect(IntNative(3).checkedMul(4), IntNative(12))
        @Expect(UInt8(3).checkedMul(4), UInt8(12))
        @Expect(UInt16(3).checkedMul(4), UInt16(12))
        @Expect(UInt32(3).checkedMul(4), UInt32(12))
        @Expect(UInt64(3).checkedMul(4), UInt64(12))
        @Expect(UIntNative(3).checkedMul(4), UIntNative(12))
    }

    @TestCase
    func testCheckedDivSuccess(): Unit {
        @Expect(Int8(8).checkedDiv(2), Int8(4))
        @Expect(Int16(8).checkedDiv(2), Int16(4))
        @Expect(Int32(8).checkedDiv(2), Int32(4))
        @Expect(Int64(8).checkedDiv(2), Int64(4))
        @Expect(IntNative(8).checkedDiv(2), IntNative(4))
        @Expect(UInt8(8).checkedDiv(2), UInt8(4))
        @Expect(UInt16(8).checkedDiv(2), UInt16(4))
        @Expect(UInt32(8).checkedDiv(2), UInt32(4))
        @Expect(UInt64(8).checkedDiv(2), UInt64(4))
        @Expect(UIntNative(8).checkedDiv(2), UIntNative(4))
    }

    @TestCase
    func testCheckedModSuccess(): Unit {
        @Expect(Int8(7).checkedMod(3), Int8(1))
        @Expect(Int16(7).checkedMod(3), Int16(1))
        @Expect(Int32(7).checkedMod(3), Int32(1))
        @Expect(Int64(7).checkedMod(3), Int64(1))
        @Expect(IntNative(7).checkedMod(3), IntNative(1))
        @Expect(UInt8(7).checkedMod(3), UInt8(1))
        @Expect(UInt16(7).checkedMod(3), UInt16(1))
        @Expect(UInt32(7).checkedMod(3), UInt32(1))
        @Expect(UInt64(7).checkedMod(3), UInt64(1))
        @Expect(UIntNative(7).checkedMod(3), UIntNative(1))
    }

    @TestCase
    func testCheckedIncSuccess(): Unit {
        @Expect(Int8(5).checkedInc(), Int8(6))
        @Expect(Int16(5).checkedInc(), Int16(6))
        @Expect(Int32(5).checkedInc(), Int32(6))
        @Expect(Int64(5).checkedInc(), Int64(6))
        @Expect(IntNative(5).checkedInc(), IntNative(6))
        @Expect(UInt8(5).checkedInc(), UInt8(6))
        @Expect(UInt16(5).checkedInc(), UInt16(6))
        @Expect(UInt32(5).checkedInc(), UInt32(6))
        @Expect(UInt64(5).checkedInc(), UInt64(6))
        @Expect(UIntNative(5).checkedInc(), UIntNative(6))
    }

    @TestCase
    func testCheckedDecSuccess(): Unit {
        @Expect(Int8(5).checkedDec(), Int8(4))
        @Expect(Int16(5).checkedDec(), Int16(4))
        @Expect(Int32(5).checkedDec(), Int32(4))
        @Expect(Int64(5).checkedDec(), Int64(4))
        @Expect(IntNative(5).checkedDec(), IntNative(4))
        @Expect(UInt8(5).checkedDec(), UInt8(4))
        @Expect(UInt16(5).checkedDec(), UInt16(4))
        @Expect(UInt32(5).checkedDec(), UInt32(4))
        @Expect(UInt64(5).checkedDec(), UInt64(4))
        @Expect(UIntNative(5).checkedDec(), UIntNative(4))
    }

    @TestCase
    func testCheckedNegSuccess(): Unit {
        @Expect(Int8(5).checkedNeg(), Int8(-5))
        @Expect(Int16(5).checkedNeg(), Int16(-5))
        @Expect(Int32(5).checkedNeg(), Int32(-5))
        @Expect(Int64(5).checkedNeg(), Int64(-5))
        @Expect(IntNative(5).checkedNeg(), IntNative(-5))
        @Expect(UInt8(0).checkedNeg(), UInt8(0))
        @Expect(UInt16(0).checkedNeg(), UInt16(0))
        @Expect(UInt32(0).checkedNeg(), UInt32(0))
        @Expect(UInt64(0).checkedNeg(), UInt64(0))
        @Expect(UIntNative(0).checkedNeg(), UIntNative(0))
    }

    // ===================== Checked overflow - boundary cases =====================

    @TestCase
    func testCheckedAddOverflowBoundary(): Unit {
        @Expect(Int8.Max.checkedAdd(1), None)
        @Expect(Int8.Min.checkedAdd(-1), None)
        @Expect(Int16.Max.checkedAdd(1), None)
        @Expect(Int16.Min.checkedAdd(-1), None)
        @Expect(Int32.Max.checkedAdd(1), None)
        @Expect(Int32.Min.checkedAdd(-1), None)
        @Expect(Int64.Max.checkedAdd(1), None)
        @Expect(Int64.Min.checkedAdd(-1), None)
        @Expect(IntNative.Max.checkedAdd(1), None)
        @Expect(IntNative.Min.checkedAdd(-1), None)
        @Expect(UInt8.Max.checkedAdd(1), None)
        @Expect(UInt16.Max.checkedAdd(1), None)
        @Expect(UInt32.Max.checkedAdd(1), None)
        @Expect(UInt64.Max.checkedAdd(1), None)
        @Expect(UIntNative.Max.checkedAdd(1), None)
    }

    @TestCase
    func testCheckedSubOverflowBoundary(): Unit {
        @Expect(Int8.Min.checkedSub(1), None)
        @Expect(Int8.Max.checkedSub(-1), None)
        @Expect(Int16.Min.checkedSub(1), None)
        @Expect(Int32.Min.checkedSub(1), None)
        @Expect(Int64.Min.checkedSub(1), None)
        @Expect(IntNative.Min.checkedSub(1), None)
        @Expect(UInt8.Min.checkedSub(1), None)
        @Expect(UInt16.Min.checkedSub(1), None)
        @Expect(UInt32.Min.checkedSub(1), None)
        @Expect(UInt64.Min.checkedSub(1), None)
        @Expect(UIntNative.Min.checkedSub(1), None)
    }

    @TestCase
    func testCheckedMulOverflowBoundary(): Unit {
        @Expect(Int8.Max.checkedMul(2), None)
        @Expect(Int8.Min.checkedMul(-2), None)
        @Expect(Int16.Max.checkedMul(2), None)
        @Expect(Int32.Max.checkedMul(2), None)
        @Expect(Int64.Max.checkedMul(2), None)
        @Expect(IntNative.Max.checkedMul(2), None)
        @Expect(UInt8.Max.checkedMul(2), None)
        @Expect(UInt16.Max.checkedMul(2), None)
        @Expect(UInt32.Max.checkedMul(2), None)
        @Expect(UInt64.Max.checkedMul(2), None)
        @Expect(UIntNative.Max.checkedMul(2), None)
    }

    @TestCase
    func testCheckedDivOverflowBoundary(): Unit {
        // IntN.Min / -1 overflow
        @Expect(Int8.Min.checkedDiv(-1), None)
        @Expect(Int16.Min.checkedDiv(-1), None)
        @Expect(Int32.Min.checkedDiv(-1), None)
        @Expect(Int64.Min.checkedDiv(-1), None)
        @Expect(IntNative.Min.checkedDiv(-1), None)
        // Division by zero throws ArithmeticException
        var count = 0
        try { Int8(5).checkedDiv(0) } catch (e: ArithmeticException) { count++ }
        try { Int16(5).checkedDiv(0) } catch (e: ArithmeticException) { count++ }
        try { Int32(5).checkedDiv(0) } catch (e: ArithmeticException) { count++ }
        try { Int64(5).checkedDiv(0) } catch (e: ArithmeticException) { count++ }
        try { IntNative(5).checkedDiv(0) } catch (e: ArithmeticException) { count++ }
        try { UInt8(5).checkedDiv(0) } catch (e: ArithmeticException) { count++ }
        try { UInt16(5).checkedDiv(0) } catch (e: ArithmeticException) { count++ }
        try { UInt32(5).checkedDiv(0) } catch (e: ArithmeticException) { count++ }
        try { UInt64(5).checkedDiv(0) } catch (e: ArithmeticException) { count++ }
        try { UIntNative(5).checkedDiv(0) } catch (e: ArithmeticException) { count++ }
        @Expect(count, 10)
    }

    @TestCase
    func testCheckedModOverflowBoundary(): Unit {
        // IntN.Min % -1: result is 0 but overflow in the process
        @Expect(Int8.Min.checkedMod(-1), None)
        @Expect(Int16.Min.checkedMod(-1), None)
        @Expect(Int32.Min.checkedMod(-1), None)
        @Expect(Int64.Min.checkedMod(-1), None)
        @Expect(IntNative.Min.checkedMod(-1), None)
        // Mod by zero throws ArithmeticException
        var count = 0
        try { Int8(5).checkedMod(0) } catch (e: ArithmeticException) { count++ }
        try { Int16(5).checkedMod(0) } catch (e: ArithmeticException) { count++ }
        try { Int32(5).checkedMod(0) } catch (e: ArithmeticException) { count++ }
        try { Int64(5).checkedMod(0) } catch (e: ArithmeticException) { count++ }
        try { IntNative(5).checkedMod(0) } catch (e: ArithmeticException) { count++ }
        try { UInt8(5).checkedMod(0) } catch (e: ArithmeticException) { count++ }
        try { UInt16(5).checkedMod(0) } catch (e: ArithmeticException) { count++ }
        try { UInt32(5).checkedMod(0) } catch (e: ArithmeticException) { count++ }
        try { UInt64(5).checkedMod(0) } catch (e: ArithmeticException) { count++ }
        try { UIntNative(5).checkedMod(0) } catch (e: ArithmeticException) { count++ }
        @Expect(count, 10)
    }

    @TestCase
    func testCheckedIncOverflowBoundary(): Unit {
        @Expect(Int8.Max.checkedInc(), None)
        @Expect(Int16.Max.checkedInc(), None)
        @Expect(Int32.Max.checkedInc(), None)
        @Expect(Int64.Max.checkedInc(), None)
        @Expect(IntNative.Max.checkedInc(), None)
        @Expect(UInt8.Max.checkedInc(), None)
        @Expect(UInt16.Max.checkedInc(), None)
        @Expect(UInt32.Max.checkedInc(), None)
        @Expect(UInt64.Max.checkedInc(), None)
        @Expect(UIntNative.Max.checkedInc(), None)
    }

    @TestCase
    func testCheckedDecOverflowBoundary(): Unit {
        @Expect(Int8.Min.checkedDec(), None)
        @Expect(Int16.Min.checkedDec(), None)
        @Expect(Int32.Min.checkedDec(), None)
        @Expect(Int64.Min.checkedDec(), None)
        @Expect(IntNative.Min.checkedDec(), None)
        @Expect(UInt8.Min.checkedDec(), None)
        @Expect(UInt16.Min.checkedDec(), None)
        @Expect(UInt32.Min.checkedDec(), None)
        @Expect(UInt64.Min.checkedDec(), None)
        @Expect(UIntNative.Min.checkedDec(), None)
    }

    @TestCase
    func testCheckedNegOverflowBoundary(): Unit {
        // IntN.Min negation overflows
        @Expect(Int8.Min.checkedNeg(), None)
        @Expect(Int16.Min.checkedNeg(), None)
        @Expect(Int32.Min.checkedNeg(), None)
        @Expect(Int64.Min.checkedNeg(), None)
        @Expect(IntNative.Min.checkedNeg(), None)
    }

    // ===================== Checked Pow =====================

    @TestCase
    func testCheckedPowSuccess(): Unit {
        @Expect(Int64(2).checkedPow(UInt64(10)), Int64(1024))
        @Expect(Int64(3).checkedPow(UInt64(4)), Int64(81))
        @Expect(Int64(5).checkedPow(UInt64(0)), Int64(1))
        @Expect(Int64(0).checkedPow(UInt64(0)), Int64(1))
    }

    @TestCase
    func testCheckedPowOverflow(): Unit {
        @Expect(Int64.Max.checkedPow(UInt64(2)), None)
        @Expect(Int64(2).checkedPow(UInt64(63)), None)
    }

    // ===================== Wrapping arithmetic - all types =====================

    @TestCase
    func testWrappingAddAllTypes(): Unit {
        @Expect(Int8.Max.wrappingAdd(1), Int8.Min)
        @Expect(Int16.Max.wrappingAdd(1), Int16.Min)
        @Expect(Int32.Max.wrappingAdd(1), Int32.Min)
        @Expect(Int64.Max.wrappingAdd(1), Int64.Min)
        @Expect(IntNative.Max.wrappingAdd(1), IntNative.Min)
        @Expect(UInt8.Max.wrappingAdd(1), UInt8.Min)
        @Expect(UInt16.Max.wrappingAdd(1), UInt16.Min)
        @Expect(UInt32.Max.wrappingAdd(1), UInt32.Min)
        @Expect(UInt64.Max.wrappingAdd(1), UInt64.Min)
        @Expect(UIntNative.Max.wrappingAdd(1), UIntNative.Min)
    }

    @TestCase
    func testWrappingSubAllTypes(): Unit {
        @Expect(Int8.Min.wrappingSub(1), Int8.Max)
        @Expect(Int16.Min.wrappingSub(1), Int16.Max)
        @Expect(Int32.Min.wrappingSub(1), Int32.Max)
        @Expect(Int64.Min.wrappingSub(1), Int64.Max)
        @Expect(IntNative.Min.wrappingSub(1), IntNative.Max)
        @Expect(UInt8.Min.wrappingSub(1), UInt8.Max)
        @Expect(UInt16.Min.wrappingSub(1), UInt16.Max)
        @Expect(UInt32.Min.wrappingSub(1), UInt32.Max)
        @Expect(UInt64.Min.wrappingSub(1), UInt64.Max)
        @Expect(UIntNative.Min.wrappingSub(1), UIntNative.Max)
    }

    @TestCase
    func testWrappingMulAllTypes(): Unit {
        @Expect(Int8.Max.wrappingMul(2), Int8(-2))
        @Expect(Int16.Max.wrappingMul(2), Int16(-2))
        @Expect(Int32.Max.wrappingMul(2), Int32(-2))
        @Expect(Int64.Max.wrappingMul(2), Int64(-2))
        @Expect(IntNative.Max.wrappingMul(2), IntNative(-2))
        @Expect(UInt8.Max.wrappingMul(2), UInt8(254))
        @Expect(UInt16.Max.wrappingMul(2), UInt16(65534))
        @Expect(UInt32.Max.wrappingMul(2), UInt32(0xFFFF_FFFE))
        @Expect(UInt64.Max.wrappingMul(2), UInt64.Max - 1)
        @Expect(UIntNative.Max.wrappingMul(2), UIntNative(UIntNative.Max - 1))
    }

    @TestCase
    func testWrappingDivAllTypes(): Unit {
        @Expect(Int8.Min.wrappingDiv(-1), Int8.Min)
        @Expect(Int16.Min.wrappingDiv(-1), Int16.Min)
        @Expect(Int32.Min.wrappingDiv(-1), Int32.Min)
        @Expect(Int64.Min.wrappingDiv(-1), Int64.Min)
        @Expect(IntNative.Min.wrappingDiv(-1), IntNative.Min)
        @Expect(UInt8(10).wrappingDiv(3), UInt8(3))
        @Expect(UInt16(10).wrappingDiv(3), UInt16(3))
        @Expect(UInt32(10).wrappingDiv(3), UInt32(3))
        @Expect(UInt64(10).wrappingDiv(3), UInt64(3))
        @Expect(UIntNative(10).wrappingDiv(3), UIntNative(3))
    }

    @TestCase
    func testWrappingModAllTypes(): Unit {
        @Expect(Int8.Min.wrappingMod(-1), 0)
        @Expect(Int16.Min.wrappingMod(-1), 0)
        @Expect(Int32.Min.wrappingMod(-1), 0)
        @Expect(Int64.Min.wrappingMod(-1), 0)
        @Expect(IntNative.Min.wrappingMod(-1), 0)
        @Expect(UInt8(10).wrappingMod(3), UInt8(1))
        @Expect(UInt16(10).wrappingMod(3), UInt16(1))
        @Expect(UInt32(10).wrappingMod(3), UInt32(1))
        @Expect(UInt64(10).wrappingMod(3), UInt64(1))
        @Expect(UIntNative(10).wrappingMod(3), UIntNative(1))
    }

    @TestCase
    func testWrappingIncAllTypes(): Unit {
        @Expect(Int8.Max.wrappingInc(), Int8.Min)
        @Expect(Int16.Max.wrappingInc(), Int16.Min)
        @Expect(Int32.Max.wrappingInc(), Int32.Min)
        @Expect(Int64.Max.wrappingInc(), Int64.Min)
        @Expect(IntNative.Max.wrappingInc(), IntNative.Min)
        @Expect(UInt8.Max.wrappingInc(), UInt8.Min)
        @Expect(UInt16.Max.wrappingInc(), UInt16.Min)
        @Expect(UInt32.Max.wrappingInc(), UInt32.Min)
        @Expect(UInt64.Max.wrappingInc(), UInt64.Min)
        @Expect(UIntNative.Max.wrappingInc(), UIntNative.Min)
    }

    @TestCase
    func testWrappingDecAllTypes(): Unit {
        @Expect(Int8.Min.wrappingDec(), Int8.Max)
        @Expect(Int16.Min.wrappingDec(), Int16.Max)
        @Expect(Int32.Min.wrappingDec(), Int32.Max)
        @Expect(Int64.Min.wrappingDec(), Int64.Max)
        @Expect(IntNative.Min.wrappingDec(), IntNative.Max)
        @Expect(UInt8.Min.wrappingDec(), UInt8.Max)
        @Expect(UInt16.Min.wrappingDec(), UInt16.Max)
        @Expect(UInt32.Min.wrappingDec(), UInt32.Max)
        @Expect(UInt64.Min.wrappingDec(), UInt64.Max)
        @Expect(UIntNative.Min.wrappingDec(), UIntNative.Max)
    }

    @TestCase
    func testWrappingNegAllTypes(): Unit {
        @Expect(Int8.Min.wrappingNeg(), Int8.Min)
        @Expect(Int16.Min.wrappingNeg(), Int16.Min)
        @Expect(Int32.Min.wrappingNeg(), Int32.Min)
        @Expect(Int64.Min.wrappingNeg(), Int64.Min)
        @Expect(IntNative.Min.wrappingNeg(), IntNative.Min)
        @Expect(UInt8(5).wrappingNeg(), UInt8(251))
        @Expect(UInt16(5).wrappingNeg(), UInt16(65531))
        @Expect(UInt32(5).wrappingNeg(), UInt32(0xFFFF_FFFB))
        @Expect(UInt64(5).wrappingNeg(), UInt64.Max - 4)
        @Expect(UIntNative(5).wrappingNeg(), UIntNative(UIntNative.Max - 4))
    }

    // ===================== Saturating arithmetic - all types =====================

    @TestCase
    func testSaturatingAddAllTypes(): Unit {
        @Expect(Int8.Max.saturatingAdd(1), Int8.Max)
        @Expect(Int8.Min.saturatingAdd(-1), Int8.Min)
        @Expect(Int16.Max.saturatingAdd(1), Int16.Max)
        @Expect(Int32.Max.saturatingAdd(1), Int32.Max)
        @Expect(Int64.Max.saturatingAdd(1), Int64.Max)
        @Expect(IntNative.Max.saturatingAdd(1), IntNative.Max)
        @Expect(UInt8.Max.saturatingAdd(1), UInt8.Max)
        @Expect(UInt16.Max.saturatingAdd(1), UInt16.Max)
        @Expect(UInt32.Max.saturatingAdd(1), UInt32.Max)
        @Expect(UInt64.Max.saturatingAdd(1), UInt64.Max)
        @Expect(UIntNative.Max.saturatingAdd(1), UIntNative.Max)
    }

    @TestCase
    func testSaturatingSubAllTypes(): Unit {
        @Expect(Int8.Min.saturatingSub(1), Int8.Min)
        @Expect(Int8.Max.saturatingSub(-1), Int8.Max)
        @Expect(Int16.Min.saturatingSub(1), Int16.Min)
        @Expect(Int32.Min.saturatingSub(1), Int32.Min)
        @Expect(Int64.Min.saturatingSub(1), Int64.Min)
        @Expect(IntNative.Min.saturatingSub(1), IntNative.Min)
        @Expect(UInt8.Min.saturatingSub(1), UInt8.Min)
        @Expect(UInt16.Min.saturatingSub(1), UInt16.Min)
        @Expect(UInt32.Min.saturatingSub(1), UInt32.Min)
        @Expect(UInt64.Min.saturatingSub(1), UInt64.Min)
        @Expect(UIntNative.Min.saturatingSub(1), UIntNative.Min)
    }

    @TestCase
    func testSaturatingMulAllTypes(): Unit {
        @Expect(Int8.Max.saturatingMul(2), Int8.Max)
        @Expect(Int8.Min.saturatingMul(2), Int8.Min)
        @Expect(Int16.Max.saturatingMul(2), Int16.Max)
        @Expect(Int32.Max.saturatingMul(2), Int32.Max)
        @Expect(Int64.Max.saturatingMul(2), Int64.Max)
        @Expect(IntNative.Max.saturatingMul(2), IntNative.Max)
        @Expect(UInt8.Max.saturatingMul(2), UInt8.Max)
        @Expect(UInt16.Max.saturatingMul(2), UInt16.Max)
        @Expect(UInt32.Max.saturatingMul(2), UInt32.Max)
        @Expect(UInt64.Max.saturatingMul(2), UInt64.Max)
        @Expect(UIntNative.Max.saturatingMul(2), UIntNative.Max)
    }

    @TestCase
    func testSaturatingDivAllTypes(): Unit {
        @Expect(Int8.Min.saturatingDiv(-1), Int8.Max)
        @Expect(Int16.Min.saturatingDiv(-1), Int16.Max)
        @Expect(Int32.Min.saturatingDiv(-1), Int32.Max)
        @Expect(Int64.Min.saturatingDiv(-1), Int64.Max)
        @Expect(IntNative.Min.saturatingDiv(-1), IntNative.Max)
        @Expect(UInt8(10).saturatingDiv(3), UInt8(3))
        @Expect(UInt16(10).saturatingDiv(3), UInt16(3))
        @Expect(UInt32(10).saturatingDiv(3), UInt32(3))
        @Expect(UInt64(10).saturatingDiv(3), UInt64(3))
        @Expect(UIntNative(10).saturatingDiv(3), UIntNative(3))
    }

    @TestCase
    func testSaturatingModAllTypes(): Unit {
        @Expect(Int8.Min.saturatingMod(-1), 0)
        @Expect(Int16.Min.saturatingMod(-1), 0)
        @Expect(Int32.Min.saturatingMod(-1), 0)
        @Expect(Int64.Min.saturatingMod(-1), 0)
        @Expect(IntNative.Min.saturatingMod(-1), 0)
        @Expect(UInt8(10).saturatingMod(3), UInt8(1))
        @Expect(UInt16(10).saturatingMod(3), UInt16(1))
        @Expect(UInt32(10).saturatingMod(3), UInt32(1))
        @Expect(UInt64(10).saturatingMod(3), UInt64(1))
        @Expect(UIntNative(10).saturatingMod(3), UIntNative(1))
    }

    @TestCase
    func testSaturatingIncAllTypes(): Unit {
        @Expect(Int8.Max.saturatingInc(), Int8.Max)
        @Expect(Int16.Max.saturatingInc(), Int16.Max)
        @Expect(Int32.Max.saturatingInc(), Int32.Max)
        @Expect(Int64.Max.saturatingInc(), Int64.Max)
        @Expect(IntNative.Max.saturatingInc(), IntNative.Max)
        @Expect(UInt8.Max.saturatingInc(), UInt8.Max)
        @Expect(UInt16.Max.saturatingInc(), UInt16.Max)
        @Expect(UInt32.Max.saturatingInc(), UInt32.Max)
        @Expect(UInt64.Max.saturatingInc(), UInt64.Max)
        @Expect(UIntNative.Max.saturatingInc(), UIntNative.Max)
    }

    @TestCase
    func testSaturatingDecAllTypes(): Unit {
        @Expect(Int8.Min.saturatingDec(), Int8.Min)
        @Expect(Int16.Min.saturatingDec(), Int16.Min)
        @Expect(Int32.Min.saturatingDec(), Int32.Min)
        @Expect(Int64.Min.saturatingDec(), Int64.Min)
        @Expect(IntNative.Min.saturatingDec(), IntNative.Min)
        @Expect(UInt8.Min.saturatingDec(), UInt8.Min)
        @Expect(UInt16.Min.saturatingDec(), UInt16.Min)
        @Expect(UInt32.Min.saturatingDec(), UInt32.Min)
        @Expect(UInt64.Min.saturatingDec(), UInt64.Min)
        @Expect(UIntNative.Min.saturatingDec(), UIntNative.Min)
    }

    @TestCase
    func testSaturatingNegAllTypes(): Unit {
        @Expect(Int8.Min.saturatingNeg(), Int8.Max)
        @Expect(Int16.Min.saturatingNeg(), Int16.Max)
        @Expect(Int32.Min.saturatingNeg(), Int32.Max)
        @Expect(Int64.Min.saturatingNeg(), Int64.Max)
        @Expect(IntNative.Min.saturatingNeg(), IntNative.Max)
        @Expect(UInt8(5).saturatingNeg(), UInt8.Min)
        @Expect(UInt16(5).saturatingNeg(), UInt16.Min)
        @Expect(UInt32(5).saturatingNeg(), UInt32.Min)
        @Expect(UInt64(5).saturatingNeg(), UInt64.Min)
        @Expect(UIntNative(5).saturatingNeg(), UIntNative.Min)
    }

    // ===================== Throwing arithmetic - all types =====================

    @TestCase
    func testThrowingAddAllTypes(): Unit {
        var count = 0
        try { Int8.Max.throwingAdd(1) } catch (e: OverflowException) { count++ }
        try { Int16.Max.throwingAdd(1) } catch (e: OverflowException) { count++ }
        try { Int32.Max.throwingAdd(1) } catch (e: OverflowException) { count++ }
        try { Int64.Max.throwingAdd(1) } catch (e: OverflowException) { count++ }
        try { IntNative.Max.throwingAdd(1) } catch (e: OverflowException) { count++ }
        try { UInt8.Max.throwingAdd(1) } catch (e: OverflowException) { count++ }
        try { UInt16.Max.throwingAdd(1) } catch (e: OverflowException) { count++ }
        try { UInt32.Max.throwingAdd(1) } catch (e: OverflowException) { count++ }
        try { UInt64.Max.throwingAdd(1) } catch (e: OverflowException) { count++ }
        try { UIntNative.Max.throwingAdd(1) } catch (e: OverflowException) { count++ }
        @Expect(count, 10)
    }

    @TestCase
    func testThrowingSubAllTypes(): Unit {
        var count = 0
        try { Int8.Min.throwingSub(1) } catch (e: OverflowException) { count++ }
        try { Int16.Min.throwingSub(1) } catch (e: OverflowException) { count++ }
        try { Int32.Min.throwingSub(1) } catch (e: OverflowException) { count++ }
        try { Int64.Min.throwingSub(1) } catch (e: OverflowException) { count++ }
        try { IntNative.Min.throwingSub(1) } catch (e: OverflowException) { count++ }
        try { UInt8.Min.throwingSub(1) } catch (e: OverflowException) { count++ }
        try { UInt16.Min.throwingSub(1) } catch (e: OverflowException) { count++ }
        try { UInt32.Min.throwingSub(1) } catch (e: OverflowException) { count++ }
        try { UInt64.Min.throwingSub(1) } catch (e: OverflowException) { count++ }
        try { UIntNative.Min.throwingSub(1) } catch (e: OverflowException) { count++ }
        @Expect(count, 10)
    }

    @TestCase
    func testThrowingMulAllTypes(): Unit {
        var count = 0
        try { Int8.Max.throwingMul(2) } catch (e: OverflowException) { count++ }
        try { Int16.Max.throwingMul(2) } catch (e: OverflowException) { count++ }
        try { Int32.Max.throwingMul(2) } catch (e: OverflowException) { count++ }
        try { Int64.Max.throwingMul(2) } catch (e: OverflowException) { count++ }
        try { IntNative.Max.throwingMul(2) } catch (e: OverflowException) { count++ }
        try { UInt8.Max.throwingMul(2) } catch (e: OverflowException) { count++ }
        try { UInt16.Max.throwingMul(2) } catch (e: OverflowException) { count++ }
        try { UInt32.Max.throwingMul(2) } catch (e: OverflowException) { count++ }
        try { UInt64.Max.throwingMul(2) } catch (e: OverflowException) { count++ }
        try { UIntNative.Max.throwingMul(2) } catch (e: OverflowException) { count++ }
        @Expect(count, 10)
    }

    @TestCase
    func testThrowingDivAllTypes(): Unit {
        var count = 0
        try { Int8.Min.throwingDiv(-1) } catch (e: OverflowException) { count++ }
        try { Int16.Min.throwingDiv(-1) } catch (e: OverflowException) { count++ }
        try { Int32.Min.throwingDiv(-1) } catch (e: OverflowException) { count++ }
        try { Int64.Min.throwingDiv(-1) } catch (e: OverflowException) { count++ }
        try { IntNative.Min.throwingDiv(-1) } catch (e: OverflowException) { count++ }
        // Div by zero throws ArithmeticException, not OverflowException
        try { UInt8(5).throwingDiv(0) } catch (e: ArithmeticException) { count++ }
        try { UInt16(5).throwingDiv(0) } catch (e: ArithmeticException) { count++ }
        try { UInt32(5).throwingDiv(0) } catch (e: ArithmeticException) { count++ }
        try { UInt64(5).throwingDiv(0) } catch (e: ArithmeticException) { count++ }
        try { UIntNative(5).throwingDiv(0) } catch (e: ArithmeticException) { count++ }
        @Expect(count, 10)
    }

    @TestCase
    func testThrowingModAllTypes(): Unit {
        // IntN.Min % -1 returns 0 (no overflow for mod)
        @Expect(Int8.Min.throwingMod(-1), 0)
        @Expect(Int16.Min.throwingMod(-1), 0)
        @Expect(Int32.Min.throwingMod(-1), 0)
        @Expect(Int64.Min.throwingMod(-1), 0)
        @Expect(IntNative.Min.throwingMod(-1), 0)
        // Mod by zero throws ArithmeticException, not OverflowException
        var count = 0
        try { Int8(5).throwingMod(0) } catch (e: ArithmeticException) { count++ }
        try { Int16(5).throwingMod(0) } catch (e: ArithmeticException) { count++ }
        try { Int32(5).throwingMod(0) } catch (e: ArithmeticException) { count++ }
        try { Int64(5).throwingMod(0) } catch (e: ArithmeticException) { count++ }
        try { IntNative(5).throwingMod(0) } catch (e: ArithmeticException) { count++ }
        try { UInt8(5).throwingMod(0) } catch (e: ArithmeticException) { count++ }
        try { UInt16(5).throwingMod(0) } catch (e: ArithmeticException) { count++ }
        try { UInt32(5).throwingMod(0) } catch (e: ArithmeticException) { count++ }
        try { UInt64(5).throwingMod(0) } catch (e: ArithmeticException) { count++ }
        try { UIntNative(5).throwingMod(0) } catch (e: ArithmeticException) { count++ }
        @Expect(count, 10)
    }

    @TestCase
    func testThrowingIncAllTypes(): Unit {
        var count = 0
        try { Int8.Max.throwingInc() } catch (e: OverflowException) { count++ }
        try { Int16.Max.throwingInc() } catch (e: OverflowException) { count++ }
        try { Int32.Max.throwingInc() } catch (e: OverflowException) { count++ }
        try { Int64.Max.throwingInc() } catch (e: OverflowException) { count++ }
        try { IntNative.Max.throwingInc() } catch (e: OverflowException) { count++ }
        try { UInt8.Max.throwingInc() } catch (e: OverflowException) { count++ }
        try { UInt16.Max.throwingInc() } catch (e: OverflowException) { count++ }
        try { UInt32.Max.throwingInc() } catch (e: OverflowException) { count++ }
        try { UInt64.Max.throwingInc() } catch (e: OverflowException) { count++ }
        try { UIntNative.Max.throwingInc() } catch (e: OverflowException) { count++ }
        @Expect(count, 10)
    }

    @TestCase
    func testThrowingDecAllTypes(): Unit {
        var count = 0
        try { Int8.Min.throwingDec() } catch (e: OverflowException) { count++ }
        try { Int16.Min.throwingDec() } catch (e: OverflowException) { count++ }
        try { Int32.Min.throwingDec() } catch (e: OverflowException) { count++ }
        try { Int64.Min.throwingDec() } catch (e: OverflowException) { count++ }
        try { IntNative.Min.throwingDec() } catch (e: OverflowException) { count++ }
        try { UInt8.Min.throwingDec() } catch (e: OverflowException) { count++ }
        try { UInt16.Min.throwingDec() } catch (e: OverflowException) { count++ }
        try { UInt32.Min.throwingDec() } catch (e: OverflowException) { count++ }
        try { UInt64.Min.throwingDec() } catch (e: OverflowException) { count++ }
        try { UIntNative.Min.throwingDec() } catch (e: OverflowException) { count++ }
        @Expect(count, 10)
    }

    @TestCase
    func testThrowingNegAllTypes(): Unit {
        var count = 0
        try { Int8.Min.throwingNeg() } catch (e: OverflowException) { count++ }
        try { Int16.Min.throwingNeg() } catch (e: OverflowException) { count++ }
        try { Int32.Min.throwingNeg() } catch (e: OverflowException) { count++ }
        try { Int64.Min.throwingNeg() } catch (e: OverflowException) { count++ }
        try { IntNative.Min.throwingNeg() } catch (e: OverflowException) { count++ }
        @Expect(count, 5)
    }

    // ===================== Throwing arithmetic - success paths =====================

    @TestCase
    func testThrowingSuccessPaths(): Unit {
        @Expect(Int8(5).throwingAdd(3), Int8(8))
        @Expect(Int16(5).throwingAdd(3), Int16(8))
        @Expect(Int32(5).throwingAdd(3), Int32(8))
        @Expect(Int64(5).throwingAdd(3), Int64(8))
        @Expect(IntNative(5).throwingAdd(3), IntNative(8))
        @Expect(UInt8(5).throwingAdd(3), UInt8(8))
        @Expect(UInt16(5).throwingAdd(3), UInt16(8))
        @Expect(UInt32(5).throwingAdd(3), UInt32(8))
        @Expect(UInt64(5).throwingAdd(3), UInt64(8))
        @Expect(UIntNative(5).throwingAdd(3), UIntNative(8))
    }

    // ===================== Throwing Pow =====================

    @TestCase
    func testThrowingPowSuccess(): Unit {
        @Expect(Int64(2).throwingPow(UInt64(10)), Int64(1024))
        @Expect(Int64(3).throwingPow(UInt64(4)), Int64(81))
        @Expect(Int64(5).throwingPow(UInt64(0)), Int64(1))
    }

    @TestCase
    func testThrowingPowOverflow(): Unit {
        var count = 0
        try { Int64.Max.throwingPow(UInt64(2)) } catch (e: OverflowException) { count++ }
        try { Int64(2).throwingPow(UInt64(63)) } catch (e: OverflowException) { count++ }
        @Expect(count, 2)
    }

    // ===================== Carrying operations - native types =====================

    @TestCase
    func testCarryingAddNative(): Unit {
        let (ov1, val1) = IntNative.Max.carryingAdd(1)
        @Expect(ov1, true)
        @Expect(val1, IntNative.Min)

        let (ov2, val2) = UIntNative.Max.carryingAdd(1)
        @Expect(ov2, true)
        @Expect(val2, UIntNative.Min)

        let (ov3, val3) = IntNative(5).carryingAdd(3)
        @Expect(ov3, false)
        @Expect(val3, IntNative(8))

        let (ov4, val4) = UIntNative(5).carryingAdd(3)
        @Expect(ov4, false)
        @Expect(val4, UIntNative(8))
    }

    @TestCase
    func testCarryingSubNative(): Unit {
        let (ov1, val1) = IntNative.Min.carryingSub(1)
        @Expect(ov1, true)
        @Expect(val1, IntNative.Max)

        let (ov2, val2) = UIntNative.Min.carryingSub(1)
        @Expect(ov2, true)
        @Expect(val2, UIntNative.Max)

        let (ov3, val3) = IntNative(5).carryingSub(3)
        @Expect(ov3, false)
        @Expect(val3, IntNative(2))

        let (ov4, val4) = UIntNative(5).carryingSub(3)
        @Expect(ov4, false)
        @Expect(val4, UIntNative(2))
    }

    @TestCase
    func testCarryingMulNative(): Unit {
        let (ov1, val1) = IntNative.Max.carryingMul(2)
        @Expect(ov1, true)
        @Expect(val1, IntNative(-2))

        let (ov2, val2) = UIntNative.Max.carryingMul(2)
        @Expect(ov2, true)
        @Expect(val2, UIntNative(UIntNative.Max - 1))

        let (ov3, val3) = IntNative(3).carryingMul(4)
        @Expect(ov3, false)
        @Expect(val3, IntNative(12))

        let (ov4, val4) = UIntNative(3).carryingMul(4)
        @Expect(ov4, false)
        @Expect(val4, UIntNative(12))
    }

    @TestCase
    func testCarryingDivNative(): Unit {
        // IntNative.Min / -1 overflow
        let (ov1, val1) = IntNative.Min.carryingDiv(-1)
        @Expect(ov1, true)
        @Expect(val1, IntNative.Min)

        let (ov2, val2) = UIntNative(10).carryingDiv(3)
        @Expect(ov2, false)
        @Expect(val2, UIntNative(3))

        let (ov3, val3) = IntNative(8).carryingDiv(2)
        @Expect(ov3, false)
        @Expect(val3, IntNative(4))
    }

    @TestCase
    func testCarryingModNative(): Unit {
        let (ov1, val1) = IntNative.Min.carryingMod(-1)
        @Expect(ov1, true)
        @Expect(val1, IntNative(0))

        let (ov2, val2) = UIntNative(10).carryingMod(3)
        @Expect(ov2, false)
        @Expect(val2, UIntNative(1))

        let (ov3, val3) = IntNative(7).carryingMod(3)
        @Expect(ov3, false)
        @Expect(val3, IntNative(1))
    }

    @TestCase
    func testCarryingIncNative(): Unit {
        let (ov1, val1) = IntNative.Max.carryingInc()
        @Expect(ov1, true)
        @Expect(val1, IntNative.Min)

        let (ov2, val2) = UIntNative.Max.carryingInc()
        @Expect(ov2, true)
        @Expect(val2, UIntNative.Min)

        let (ov3, val3) = IntNative(5).carryingInc()
        @Expect(ov3, false)
        @Expect(val3, IntNative(6))
    }

    @TestCase
    func testCarryingDecNative(): Unit {
        let (ov1, val1) = IntNative.Min.carryingDec()
        @Expect(ov1, true)
        @Expect(val1, IntNative.Max)

        let (ov2, val2) = UIntNative.Min.carryingDec()
        @Expect(ov2, true)
        @Expect(val2, UIntNative.Max)

        let (ov3, val3) = IntNative(5).carryingDec()
        @Expect(ov3, false)
        @Expect(val3, IntNative(4))
    }

    @TestCase
    func testCarryingNegNative(): Unit {
        let (ov1, val1) = IntNative.Min.carryingNeg()
        @Expect(ov1, true)
        @Expect(val1, IntNative.Min)

        let (ov2, val2) = IntNative(5).carryingNeg()
        @Expect(ov2, false)
        @Expect(val2, IntNative(-5))
    }

    @TestCase
    func testCarryingShlNative(): Unit {
        // No overflow (y < bitWidth)
        let (ov1, val1) = IntNative(1).carryingShl(UInt64(1))
        @Expect(ov1, false)
        @Expect(val1, IntNative(2))

        // Overflow (y >= bitWidth on 64-bit)
        let (ov2, val2) = IntNative(1).carryingShl(UInt64(64))
        @Expect(ov2, true)
        @Expect(val2, IntNative(1))

        let (ov3, val3) = UIntNative(1).carryingShl(UInt64(1))
        @Expect(ov3, false)
        @Expect(val3, UIntNative(2))

        let (ov4, val4) = UIntNative(1).carryingShl(UInt64(64))
        @Expect(ov4, true)
        @Expect(val4, UIntNative(1))
    }

    @TestCase
    func testCarryingShrNative(): Unit {
        let (ov1, val1) = IntNative.Min.carryingShr(UInt64(1))
        @Expect(ov1, false)
        @Expect(val1, IntNative.Min >> 1)

        let (ov2, val2) = IntNative(-1).carryingShr(UInt64(64))
        @Expect(ov2, true)
        @Expect(val2, IntNative(-1))

        let (ov3, val3) = UIntNative.Max.carryingShr(UInt64(1))
        @Expect(ov3, false)
        @Expect(val3, UIntNative.Max >> 1)

        let (ov4, val4) = UIntNative.Max.carryingShr(UInt64(64))
        @Expect(ov4, true)
        @Expect(val4, UIntNative.Max)
    }

    // ===================== Wrapping/Saturating Pow =====================

    @TestCase
    func testWrappingPow(): Unit {
        @Expect(Int64(2).wrappingPow(UInt64(10)), Int64(1024))
        @Expect(Int64(3).wrappingPow(UInt64(4)), Int64(81))
        @Expect(Int64(5).wrappingPow(UInt64(0)), Int64(1))
    }

    @TestCase
    func testSaturatingPow(): Unit {
        @Expect(Int64(2).saturatingPow(UInt64(10)), Int64(1024))
        @Expect(Int64(3).saturatingPow(UInt64(4)), Int64(81))
        @Expect(Int64(5).saturatingPow(UInt64(0)), Int64(1))
        @Expect(Int64.Max.saturatingPow(UInt64(2)), Int64.Max)
    }

    @TestCase
    func testCarryingPowNative(): Unit {
        let (ov1, val1) = Int64(2).carryingPow(UInt64(10))
        @Expect(ov1, false)
        @Expect(val1, Int64(1024))

        let (ov2, val2) = Int64.Max.carryingPow(UInt64(2))
        @Expect(ov2, true)
    }

    // ===================== Saturating non-overflow paths =====================

    @TestCase
    func testSaturatingNormalOps(): Unit {
        @Expect(Int8(5).saturatingAdd(3), Int8(8))
        @Expect(Int8(5).saturatingSub(3), Int8(2))
        @Expect(Int8(3).saturatingMul(4), Int8(12))
        @Expect(Int8(8).saturatingDiv(2), Int8(4))
        @Expect(Int8(7).saturatingMod(3), Int8(1))
        @Expect(Int8(5).saturatingInc(), Int8(6))
        @Expect(Int8(5).saturatingDec(), Int8(4))
        @Expect(Int8(5).saturatingNeg(), Int8(-5))
    }

    // ===================== Wrapping non-overflow paths =====================

    @TestCase
    func testWrappingNormalOps(): Unit {
        @Expect(Int8(5).wrappingAdd(3), Int8(8))
        @Expect(Int8(5).wrappingSub(3), Int8(2))
        @Expect(Int8(3).wrappingMul(4), Int8(12))
        @Expect(Int8(8).wrappingDiv(2), Int8(4))
        @Expect(Int8(7).wrappingMod(3), Int8(1))
        @Expect(Int8(5).wrappingInc(), Int8(6))
        @Expect(Int8(5).wrappingDec(), Int8(4))
        @Expect(Int8(5).wrappingNeg(), Int8(-5))
    }

    // ===================== Wrapping/Saturating shift - all fixed-width types =====================

    @TestCase
    func testWrappingShiftAllFixedWidthShlBoundary(): Unit {
        // Boundary at y == bitwidth for each type
        @Expect(Int8(1).wrappingShl(UInt64(8)), 1)
        @Expect(Int16(1).wrappingShl(UInt64(16)), 1)
        @Expect(Int32(1).wrappingShl(UInt64(32)), 1)
        @Expect(Int64(1).wrappingShl(UInt64(64)), 1)
        @Expect(UInt8(1).wrappingShl(UInt64(8)), 1)
        @Expect(UInt16(1).wrappingShl(UInt64(16)), 1)
        @Expect(UInt32(1).wrappingShl(UInt64(32)), 1)
        @Expect(UInt64(1).wrappingShl(UInt64(64)), 1)
    }

    @TestCase
    func testWrappingShiftAllFixedWidthShrBoundary(): Unit {
        @Expect(Int8.Min.wrappingShr(UInt64(8)), Int8.Min)
        @Expect(Int16.Min.wrappingShr(UInt64(16)), Int16.Min)
        @Expect(Int32.Min.wrappingShr(UInt64(32)), Int32.Min)
        @Expect(Int64.Min.wrappingShr(UInt64(64)), Int64.Min)
        let u8: UInt8 = 128
        @Expect(u8.wrappingShr(UInt64(8)), u8)
        let u16: UInt16 = 32768
        @Expect(u16.wrappingShr(UInt64(16)), u16)
        let u32: UInt32 = 2147483648
        @Expect(u32.wrappingShr(UInt64(32)), u32)
        let u64: UInt64 = 9223372036854775808
        @Expect(u64.wrappingShr(UInt64(64)), u64)
    }

    @TestCase
    func testSaturatingShiftAllFixedWidthShlBoundary(): Unit {
        @Expect(Int8(1).saturatingShl(UInt64(8)), Int8.Min)
        @Expect(Int16(1).saturatingShl(UInt64(16)), Int16.Min)
        @Expect(Int32(1).saturatingShl(UInt64(32)), Int32.Min)
        @Expect(Int64(1).saturatingShl(UInt64(64)), Int64.Min)
        @Expect(UInt8(1).saturatingShl(UInt64(8)), UInt8(128))
        @Expect(UInt16(1).saturatingShl(UInt64(16)), UInt16(0x8000))
        @Expect(UInt32(1).saturatingShl(UInt64(32)), UInt32(0x8000_0000))
        @Expect(UInt64(1).saturatingShl(UInt64(64)), UInt64(1) << UInt64(63))
    }

    @TestCase
    func testSaturatingShiftAllFixedWidthShrBoundary(): Unit {
        @Expect(Int8.Min.saturatingShr(UInt64(8)), Int8(-1))
        @Expect(Int16.Min.saturatingShr(UInt64(16)), Int16(-1))
        @Expect(Int32.Min.saturatingShr(UInt64(32)), Int32(-1))
        @Expect(Int64.Min.saturatingShr(UInt64(64)), Int64(-1))
        let u8: UInt8 = 128
        @Expect(u8.saturatingShr(UInt64(8)), UInt8(1))
        let u16: UInt16 = 32768
        @Expect(u16.saturatingShr(UInt64(16)), UInt16(1))
        let u32: UInt32 = 2147483648
        @Expect(u32.saturatingShr(UInt64(32)), UInt32(1))
        let u64: UInt64 = 9223372036854775808
        @Expect(u64.saturatingShr(UInt64(64)), UInt64(1))
    }

    // ===================== Checked shift - all types boundary =====================

    @TestCase
    func testCheckedShiftAllTypesBoundary(): Unit {
        // Shl at bitwidth boundary: None
        @Expect(Int8(1).checkedShl(UInt64(8)), None)
        @Expect(Int16(1).checkedShl(UInt64(16)), None)
        @Expect(Int32(1).checkedShl(UInt64(32)), None)
        @Expect(Int64(1).checkedShl(UInt64(64)), None)
        @Expect(UInt8(1).checkedShl(UInt64(8)), None)
        @Expect(UInt16(1).checkedShl(UInt64(16)), None)
        @Expect(UInt32(1).checkedShl(UInt64(32)), None)
        @Expect(UInt64(1).checkedShl(UInt64(64)), None)
        @Expect(IntNative(1).checkedShl(UInt64(64)), None)
        @Expect(UIntNative(1).checkedShl(UInt64(64)), None)

        // Shr at bitwidth boundary: None
        @Expect(Int8.Min.checkedShr(UInt64(8)), None)
        @Expect(Int16.Min.checkedShr(UInt64(16)), None)
        @Expect(Int32.Min.checkedShr(UInt64(32)), None)
        @Expect(Int64.Min.checkedShr(UInt64(64)), None)
        @Expect(IntNative(-1).checkedShr(UInt64(64)), None)
        @Expect(UIntNative(1).checkedShr(UInt64(64)), None)
    }

    // ===================== Throwing shift - all types boundary =====================

    @TestCase
    func testThrowingShiftAllTypesBoundary(): Unit {
        var count = 0
        try { Int8(1).throwingShl(UInt64(8)) } catch (e: OvershiftException) { count++ }
        try { Int16(1).throwingShl(UInt64(16)) } catch (e: OvershiftException) { count++ }
        try { Int32(1).throwingShl(UInt64(32)) } catch (e: OvershiftException) { count++ }
        try { Int64(1).throwingShl(UInt64(64)) } catch (e: OvershiftException) { count++ }
        try { IntNative(1).throwingShl(UInt64(64)) } catch (e: OvershiftException) { count++ }
        try { UInt8(1).throwingShl(UInt64(8)) } catch (e: OvershiftException) { count++ }
        try { UInt16(1).throwingShl(UInt64(16)) } catch (e: OvershiftException) { count++ }
        try { UInt32(1).throwingShl(UInt64(32)) } catch (e: OvershiftException) { count++ }
        try { UInt64(1).throwingShl(UInt64(64)) } catch (e: OvershiftException) { count++ }
        try { UIntNative(1).throwingShl(UInt64(64)) } catch (e: OvershiftException) { count++ }
        @Expect(count, 10)

        count = 0
        try { Int8.Min.throwingShr(UInt64(8)) } catch (e: OvershiftException) { count++ }
        try { Int16.Min.throwingShr(UInt64(16)) } catch (e: OvershiftException) { count++ }
        try { Int32.Min.throwingShr(UInt64(32)) } catch (e: OvershiftException) { count++ }
        try { Int64.Min.throwingShr(UInt64(64)) } catch (e: OvershiftException) { count++ }
        try { IntNative.Min.throwingShr(UInt64(64)) } catch (e: OvershiftException) { count++ }
        try { UInt8(1).throwingShr(UInt64(8)) } catch (e: OvershiftException) { count++ }
        try { UInt16(1).throwingShr(UInt64(16)) } catch (e: OvershiftException) { count++ }
        try { UInt32(1).throwingShr(UInt64(32)) } catch (e: OvershiftException) { count++ }
        try { UInt64(1).throwingShr(UInt64(64)) } catch (e: OvershiftException) { count++ }
        try { UIntNative(1).throwingShr(UInt64(64)) } catch (e: OvershiftException) { count++ }
        @Expect(count, 10)
    }
}
