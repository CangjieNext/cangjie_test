/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 11,.*SKIPPED.*: 0,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

internal import std.overflow.*
internal import std.math.*
internal import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestCarrying {
    @TestCase
    func testAdd(): Unit {
        var i8max: Int8 = Int8.Max
        var (i8result, i8carry) = i8max.carryingAdd(1)
        @Expect(i8result, true)
        @Expect(i8carry, Int8.Min)

        var i8min: Int8 = Int8.Min
        (i8result, i8carry) = i8min.carryingAdd(-1)
        @Expect(i8result, true)
        @Expect(i8carry, Int8.Max)

        var u8max: UInt8 = UInt8.Max
        var (u8result, u8carry) = u8max.carryingAdd(1)
        @Expect(u8result, true)
        @Expect(u8carry, UInt8.Min)

        var i16max: Int16 = Int16.Max
        var (i16result, i16carry) = i16max.carryingAdd(1)
        @Expect(i16result, true)
        @Expect(i16carry, Int16.Min)

        var i16min: Int16 = Int16.Min
        (i16result, i16carry) = i16min.carryingAdd(-1)
        @Expect(i16result, true)
        @Expect(i16carry, Int16.Max)

        var u16max: UInt16 = UInt16.Max
        var (u16result, u16carry) = u16max.carryingAdd(1)
        @Expect(u16result, true)
        @Expect(u16carry, UInt16.Min)

        var i32max: Int32 = Int32.Max
        var (i32result, i32carry) = i32max.carryingAdd(1)
        @Expect(i32result, true)
        @Expect(i32carry, Int32.Min)

        var i32min: Int32 = Int32.Min
        (i32result, i32carry) = i32min.carryingAdd(-1)
        @Expect(i32result, true)
        @Expect(i32carry, Int32.Max)

        var u32max: UInt32 = UInt32.Max
        var (u32result, u32carry) = u32max.carryingAdd(1)
        @Expect(u32result, true)
        @Expect(u32carry, UInt32.Min)

        var i64max: Int64 = Int64.Max
        var (i64result, i64carry) = i64max.carryingAdd(1)
        @Expect(i64result, true)

        var i64min: Int64 = Int64.Min
        (i64result, i64carry) = i64min.carryingAdd(-1)
        @Expect(i64result, true)
        @Expect(i64carry, Int64.Max)

        var u64max: UInt64 = UInt64.Max
        var (u64result, u64carry) = u64max.carryingAdd(1)
        @Expect(u64result, true)
        @Expect(u64carry, UInt64.Min)

        var inativeMax: IntNative = IntNative.Max
        var (inativeResult, inativeCarry) = inativeMax.carryingAdd(1)
        @Expect(inativeResult, true)
        @Expect(inativeCarry, IntNative.Min)

        var inativeMin: IntNative = IntNative.Min
        (inativeResult, inativeCarry) = inativeMin.carryingAdd(-1)
        @Expect(inativeResult, true)
        @Expect(inativeCarry, IntNative.Max)

        var unative: UIntNative = UIntNative.Max
        var (unativeResult, unativeCarry) = unative.carryingAdd(1)
        @Expect(unativeResult, true)
        @Expect(unativeCarry, UIntNative.Min)
    }

    @TestCase
    func testSub() {
        var i8min: Int8 = Int8.Min
        var (i8result, i8borrow) = i8min.carryingSub(1)
        @Expect(i8result, true)
        @Expect(i8borrow, Int8.Max)

        var i8max: Int8 = Int8.Max
        (i8result, i8borrow) = i8max.carryingSub(-1)
        @Expect(i8result, true)
        @Expect(i8borrow, Int8.Min)

        var u8min: UInt8 = UInt8.Min
        var (u8result, u8borrow) = u8min.carryingSub(1)
        @Expect(u8result, true)
        @Expect(u8borrow, UInt8.Max)

        var i16min: Int16 = Int16.Min
        var (i16result, i16borrow) = i16min.carryingSub(1)
        @Expect(i16result, true)
        @Expect(i16borrow, Int16.Max)

        var i16max: Int16 = Int16.Max
        (i16result, i16borrow) = i16max.carryingSub(-1)
        @Expect(i16result, true)
        @Expect(i16borrow, Int16.Min)

        var u16min: UInt16 = UInt16.Min
        var (u16result, u16borrow) = u16min.carryingSub(1)
        @Expect(u16result, true)
        @Expect(u16borrow, UInt16.Max)

        var i32min: Int32 = Int32.Min
        var (i32result, i32borrow) = i32min.carryingSub(1)
        @Expect(i32result, true)
        @Expect(i32borrow, Int32.Max)

        var i32max: Int32 = Int32.Max
        (i32result, i32borrow) = i32max.carryingSub(-1)
        @Expect(i32result, true)
        @Expect(i32borrow, Int32.Min)

        var u32min: UInt32 = UInt32.Min
        var (u32result, u32borrow) = u32min.carryingSub(1)
        @Expect(u32result, true)
        @Expect(u32borrow, UInt32.Max)

        var i64min: Int64 = Int64.Min
        var (i64result, i64borrow) = i64min.carryingSub(1)
        @Expect(i64result, true)
        @Expect(i64borrow, Int64.Max)

        var i64max: Int64 = Int64.Max
        (i64result, i64borrow) = i64max.carryingSub(-1)
        @Expect(i64result, true)
        @Expect(i64borrow, Int64.Min)

        var unativeMin: UIntNative = UIntNative.Min
        var (unativeResult, unativeBorrow) = unativeMin.carryingSub(1)
        @Expect(unativeResult, true)
        @Expect(unativeBorrow, UIntNative.Max)

        var inativeMin: IntNative = IntNative.Min
        var (inativeResult, inativeBorrow) = inativeMin.carryingSub(1)
        @Expect(inativeResult, true)
        @Expect(inativeBorrow, IntNative.Max)

        var inativeMax: IntNative = IntNative.Max
        (inativeResult, inativeBorrow) = inativeMax.carryingSub(-1)
        @Expect(inativeResult, true)
        @Expect(inativeBorrow, IntNative.Min)
    }

    @TestCase
    func testMul() {
        var i8max: Int8 = Int8.Max
        var (i8result, i8overflow) = i8max.carryingMul(2)
        @Expect(i8result, true)
        @Expect(i8overflow, -2)

        var i16max: Int16 = Int16.Max
        var (i16result, i16overflow) = i16max.carryingMul(2)
        @Expect(i16result, true)
        @Expect(i16overflow, -2)

        var i32max: Int32 = Int32.Max
        var (i32result, i32overflow) = i32max.carryingMul(2)
        @Expect(i32result, true)
        @Expect(i32overflow, -2)

        var i64max: Int64 = Int64.Max
        var (i64result, i64overflow) = i64max.carryingMul(2)
        @Expect(i64result, true)
        @Expect(i64overflow, -2)

        var inativeMax: IntNative = IntNative.Max
        var (inativeResult, inativeOverflow) = inativeMax.carryingMul(2)
        @Expect(inativeResult, true)
        @Expect(inativeOverflow, -2)

        var u8max: UInt8 = UInt8.Max
        var (u8result, u8overflow) = u8max.carryingMul(2)
        @Expect(u8result, true)
        @Expect(u8overflow, UInt8.Max - 1)

        var u16max: UInt16 = UInt16.Max
        var (u16result, u16overflow) = u16max.carryingMul(2)
        @Expect(u16result, true)
        @Expect(u16overflow, UInt16.Max - 1)

        var u32max: UInt32 = UInt32.Max
        var (u32result, u32overflow) = u32max.carryingMul(2)
        @Expect(u32result, true)
        @Expect(u32overflow, UInt32.Max - 1)

        var u64max: UInt64 = UInt64.Max
        var (u64result, u64overflow) = u64max.carryingMul(2)
        @Expect(u64result, true)
        @Expect(u64overflow, UInt64.Max - 1)

        var unativeMax: UIntNative = UIntNative.Max
        var (unativeResult, unativeOverflow) = unativeMax.carryingMul(2)
        @Expect(unativeResult, true)
        @Expect(unativeOverflow, UIntNative.Max - 1)
    }

    @TestCase
    func testDiv() {
        var i8min: Int8 = Int8.Min
        var (i8result, i8rem) = i8min.carryingDiv(-1)
        @Expect(i8result, true)
        @Expect(i8rem, Int8.Min)

        var i16min: Int16 = Int16.Min
        var (i16result, i16rem) = i16min.carryingDiv(-1)
        @Expect(i16result, true)
        @Expect(i16rem, Int16.Min)

        var i32min: Int32 = Int32.Min
        var (i32result, i32rem) = i32min.carryingDiv(-1)
        @Expect(i32result, true)
        @Expect(i32rem, Int32.Min)

        var i64min: Int64 = Int64.Min
        var (i64result, i64rem) = i64min.carryingDiv(-1)
        @Expect(i64result, true)
        @Expect(i64rem, Int64.Min)

        var inativemin: IntNative = IntNative.Min
        var (inativeresult, inativerem) = inativemin.carryingDiv(-1)
        @Expect(inativeresult, true)
        @Expect(inativerem, IntNative.Min)

        var u8min: UInt8 = UInt8.Max
        var (u8result, u8rem) = u8min.carryingDiv(1)
        @Expect(u8result, false)
        @Expect(u8rem, UInt8.Max)

        var u16min: UInt16 = UInt16.Max
        var (u16result, u16rem) = u16min.carryingDiv(1)
        @Expect(u16result, false)
        @Expect(u16rem, UInt16.Max)

        var u32min: UInt32 = UInt32.Max
        var (u32result, u32rem) = u32min.carryingDiv(1)
        @Expect(u32result, false)
        @Expect(u32rem, UInt32.Max)

        var u64min: UInt64 = UInt64.Max
        var (u64result, u64rem) = u64min.carryingDiv(1)
        @Expect(u64result, false)
        @Expect(u64rem, UInt64.Max)

        var unativeMin: UIntNative = UIntNative.Max
        var (unativeResult, unativeRem) = unativeMin.carryingDiv(1)
        @Expect(unativeResult, false)
        @Expect(unativeRem, UIntNative.Max)
    }

    @TestCase
    func testMod(): Unit {
        var i8min: Int8 = Int8.Min
        var (i8result, i8overflow) = i8min.carryingMod(1)
        @Expect(i8result, false)
        @Expect(i8overflow, 0)

        var i16min: Int16 = Int16.Min
        var (i16result, i16overflow) = i16min.carryingMod(1)
        @Expect(i16result, false)
        @Expect(i16overflow, 0)

        var i32min: Int32 = Int32.Min
        var (i32result, i32overflow) = i32min.carryingMod(1)
        @Expect(i32result, false)
        @Expect(i32overflow, 0)

        var i64min: Int64 = Int64.Min
        var (i64result, i64overflow) = i64min.carryingMod(1)
        @Expect(i64result, false)
        @Expect(i64overflow, 0)

        var u8min: UInt8 = UInt8.Min
        var (u8result, u8overflow) = u8min.carryingMod(1)
        @Expect(u8result, false)
        @Expect(u8overflow, 0)

        var u16min: UInt16 = UInt16.Min
        var (u16result, u16overflow) = u16min.carryingMod(1)
        @Expect(u16result, false)
        @Expect(u16overflow, 0)

        var u32min: UInt32 = UInt32.Min
        var (u32result, u32overflow) = u32min.carryingMod(1)
        @Expect(u32result, false)
        @Expect(u32overflow, 0)

        var u64min: UInt64 = UInt64.Min
        var (u64result, u64overflow) = u64min.carryingMod(1)
        @Expect(u64result, false)
        @Expect(u64overflow, 0)
    }

    @TestCase
    func testInc(): Unit {
        var i8min: Int8 = Int8.Min
        var (i8result, i8overflow) = i8min.carryingInc()
        @Expect(i8result, false)
        @Expect(i8overflow, -127)

        var i8max: Int8 = Int8.Max
        (i8result, i8overflow) = i8max.carryingInc()
        @Expect(i8result, true)
        @Expect(i8overflow, Int8.Min)

        var i16min: Int16 = Int16.Min
        var (i16result, i16overflow) = i16min.carryingInc()
        @Expect(i16result, false)
        @Expect(i16overflow, -32767)

        var i16max: Int16 = Int16.Max
        (i16result, i16overflow) = i16max.carryingInc()
        @Expect(i16result, true)
        @Expect(i16overflow, Int16.Min)

        var i32min: Int32 = Int32.Min
        var (i32result, i32overflow) = i32min.carryingInc()
        @Expect(i32result, false)
        @Expect(i32overflow, -2147483647)

        var i32max: Int32 = Int32.Max
        (i32result, i32overflow) = i32max.carryingInc()
        @Expect(i32result, true)
        @Expect(i32overflow, Int32.Min)

        var i64min: Int64 = Int64.Min
        var (i64result, i64overflow) = i64min.carryingInc()
        @Expect(i64result, false)
        @Expect(i64overflow, -9223372036854775807)

        var i64max: Int64 = Int64.Max
        (i64result, i64overflow) = i64max.carryingInc()
        @Expect(i64result, true)
        @Expect(i64overflow, Int64.Min)

        var inativeMin: IntNative = IntNative.Min
        var (inativeResult, inativeOverflow) = inativeMin.carryingInc()
        @Expect(inativeResult, false)
        @Expect(inativeOverflow, IntNative.Min + 1)

        var inativemax: IntNative = IntNative.Max
        (inativeResult, inativeOverflow) = inativemax.carryingInc()
        @Expect(inativeResult, true)
        @Expect(inativeOverflow, IntNative.Min)

        var u8min: UInt8 = UInt8.Min
        var (u8result, u8overflow) = u8min.carryingInc()
        @Expect(u8result, false)
        @Expect(u8overflow, 1)

        var u8max: UInt8 = UInt8.Max
        (u8result, u8overflow) = u8max.carryingInc()
        @Expect(u8result, true)
        @Expect(u8overflow, UInt8.Min)

        var u16min: UInt16 = UInt16.Min
        var (u16result, u16overflow) = u16min.carryingInc()
        @Expect(u16result, false)
        @Expect(u16overflow, 1)

        var u16max: UInt16 = UInt16.Max
        (u16result, u16overflow) = u16max.carryingInc()
        @Expect(u16result, true)
        @Expect(u16overflow, UInt16.Min)

        var u32min: UInt32 = UInt32.Min
        var (u32result, u32overflow) = u32min.carryingInc()
        @Expect(u32result, false)
        @Expect(u32overflow, 1)

        var u32max: UInt32 = UInt32.Max
        (u32result, u32overflow) = u32max.carryingInc()
        @Expect(u32result, true)
        @Expect(u32overflow, UInt32.Min)

        var u64min: UInt64 = UInt64.Min
        var (u64result, u64overflow) = u64min.carryingInc()
        @Expect(u64result, false)
        @Expect(u64overflow, 1)

        var u64max: UInt64 = UInt64.Max
        (u64result, u64overflow) = u64max.carryingInc()
        @Expect(u64result, true)
        @Expect(u64overflow, UInt64.Min)

        var unativeMin: UIntNative = UIntNative.Min
        var (unativeResult, unativeOverflow) = unativeMin.carryingInc()
        @Expect(unativeResult, false)
        @Expect(unativeOverflow, 1)

        var unativemax: UIntNative = UIntNative.Max
        (unativeResult, unativeOverflow) = unativemax.carryingInc()
        @Expect(unativeResult, true)
        @Expect(unativeOverflow, UIntNative.Min)
    }

    @TestCase
    func testDec(): Unit {
        var i8min: Int8 = Int8.Min
        var (i8result, i8overflow) = i8min.carryingDec()
        @Expect(i8result, true)
        @Expect(i8overflow, Int8.Max)

        var i8max: Int8 = Int8.Max
        (i8result, i8overflow) = i8max.carryingDec()
        @Expect(i8result, false)
        @Expect(i8overflow, 126)

        var i16min: Int16 = Int16.Min
        var (i16result, i16overflow) = i16min.carryingDec()
        @Expect(i16result, true)
        @Expect(i16overflow, Int16.Max)

        var i16max: Int16 = Int16.Max
        (i16result, i16overflow) = i16max.carryingDec()
        @Expect(i16result, false)
        @Expect(i16overflow, 32766)

        var i32min: Int32 = Int32.Min
        var (i32result, i32overflow) = i32min.carryingDec()
        @Expect(i32result, true)
        @Expect(i32overflow, Int32.Max)

        var i32max: Int32 = Int32.Max
        (i32result, i32overflow) = i32max.carryingDec()
        @Expect(i32result, false)
        @Expect(i32overflow, 2147483646)

        var i64min: Int64 = Int64.Min
        var (i64result, i64overflow) = i64min.carryingDec()
        @Expect(i64result, true)
        @Expect(i64overflow, Int64.Max)

        var i64max: Int64 = Int64.Max
        (i64result, i64overflow) = i64max.carryingDec()
        @Expect(i64result, false)
        @Expect(i64overflow, 9223372036854775806)

        var inativeMin: IntNative = IntNative.Min
        var (inativeResult, inativeOverflow) = inativeMin.carryingDec()
        @Expect(inativeResult, true)
        @Expect(inativeOverflow, IntNative.Max)

        var inativemax: IntNative = IntNative.Max
        (inativeResult, inativeOverflow) = inativemax.carryingDec()
        @Expect(inativeResult, false)
        @Expect(inativeOverflow, IntNative.Max-1)

        var u8min: UInt8 = UInt8.Min
        var (u8result, u8overflow) = u8min.carryingDec()
        @Expect(u8result, true)
        @Expect(u8overflow, UInt8.Max)

        var u8max: UInt8 = UInt8.Max
        (u8result, u8overflow) = u8max.carryingDec()
        @Expect(u8result, false)
        @Expect(u8overflow, 254)

        var u16min: UInt16 = UInt16.Min
        var (u16result, u16overflow) = u16min.carryingDec()
        @Expect(u16result, true)
        @Expect(u16overflow, UInt16.Max)

        var u16max: UInt16 = UInt16.Max
        (u16result, u16overflow) = u16max.carryingDec()
        @Expect(u16result, false)
        @Expect(u16overflow, 65534)

        var u32min: UInt32 = UInt32.Min
        var (u32result, u32overflow) = u32min.carryingDec()
        @Expect(u32result, true)
        @Expect(u32overflow, UInt32.Max)

        var u32max: UInt32 = UInt32.Max
        (u32result, u32overflow) = u32max.carryingDec()
        @Expect(u32result, false)
        @Expect(u32overflow, 4294967294)

        var u64min: UInt64 = UInt64.Min
        var (u64result, u64overflow) = u64min.carryingDec()
        @Expect(u64result, true)
        @Expect(u64overflow, UInt64.Max)

        var u64max: UInt64 = UInt64.Max
        (u64result, u64overflow) = u64max.carryingDec()
        @Expect(u64result, false)
        @Expect(u64overflow, 18446744073709551614)

        var unativeMin: UIntNative = UIntNative.Min
        var (unativeResult, unativeOverflow) = unativeMin.carryingDec()
        @Expect(unativeResult, true)
        @Expect(unativeOverflow, UIntNative.Max)

        var unativemax: UIntNative = UIntNative.Max
        (unativeResult, unativeOverflow) = unativemax.carryingDec()
        @Expect(unativeResult, false)
        @Expect(unativeOverflow, UIntNative.Max-1)
    }

    @TestCase
    func testNeg(): Unit {
        var i8min: Int8 = Int8.Min
        var (i8result, i8neg) = i8min.carryingNeg()
        @Expect(i8result, true)
        @Expect(i8neg, Int8.Min)

        var i8max: Int8 = Int8.Max
        (i8result, i8neg) = i8max.carryingNeg()
        @Expect(i8result, false)
        @Expect(i8neg, -127)

        var i16min: Int16 = Int16.Min
        var (i16result, i16neg) = i16min.carryingNeg()
        @Expect(i16result, true)
        @Expect(i16neg, Int16.Min)

        var i16max: Int16 = Int16.Max
        (i16result, i16neg) = i16max.carryingNeg()
        @Expect(i16result, false)
        @Expect(i16neg, -Int16.Max)

        var i32min: Int32 = Int32.Min
        var (i32result, i32neg) = i32min.carryingNeg()
        @Expect(i32result, true)
        @Expect(i32neg, Int32.Min)

        var i32max: Int32 = Int32.Max
        (i32result, i32neg) = i32max.carryingNeg()
        @Expect(i32result, false)
        @Expect(i32neg, -Int32.Max)

        var i64min: Int64 = Int64.Min
        var (i64result, i64neg) = i64min.carryingNeg()
        @Expect(i64result, true)
        @Expect(i64neg, Int64.Min)

        var i64max: Int64 = Int64.Max
        (i64result, i64neg) = i64max.carryingNeg()
        @Expect(i64result, false)
        @Expect(i64neg, -Int64.Max)

        var inativemin: IntNative = IntNative.Min
        var (inativeresult, inativeneg) = inativemin.carryingNeg()
        @Expect(inativeresult, true)
        @Expect(inativeneg, IntNative.Min)

        var inativemax: IntNative = IntNative.Max
        (inativeresult, inativeneg) = inativemax.carryingNeg()
        @Expect(inativeresult, false)
        @Expect(inativeneg, -IntNative.Max)

        var u8max = UInt8.Max
        var (u8result, u8neg) = u8max.carryingNeg()
        @Expect(u8result, true)
        @Expect(u8neg, 1)

        var u8min: UInt8 = UInt8.Min
        (u8result, u8neg) = u8min.carryingNeg()
        @Expect(u8result, false)
        @Expect(u8neg, 0)

        var u16min: UInt16 = UInt16.Min
        var (u16result, u16neg) = u16min.carryingNeg()
        @Expect(u16result, false)
        @Expect(u16neg, 0)

        var u16max: UInt16 = UInt16.Max
        (u16result, u16neg) = u16max.carryingNeg()
        @Expect(u16result, true)
        @Expect(u16neg, 1)

        var u32min: UInt32 = UInt32.Min
        var (u32result, u32neg) = u32min.carryingNeg()
        @Expect(u32result, false)
        @Expect(u32neg, 0)

        var u32max: UInt32 = UInt32.Max
        (u32result, u32neg) = u32max.carryingNeg()
        @Expect(u32result, true)
        @Expect(u32neg, 1)

        var u64min: UInt64 = UInt64.Min
        var (u64result, u64neg) = u64min.carryingNeg()
        @Expect(u64result, false)
        @Expect(u64neg, 0)

        var u64max: UInt64 = UInt64.Max
        (u64result, u64neg) = u64max.carryingNeg()
        @Expect(u64result, true)
        @Expect(u64neg, 1)

        var unativemin: UIntNative = UIntNative.Min
        var (unativeresult, unativeneg) = unativemin.carryingNeg()
        @Expect(unativeresult, false)
        @Expect(unativeneg, 0)

        var unativemax: UIntNative = UIntNative.Max
        (unativeresult, unativeneg) = unativemax.carryingNeg()
        @Expect(unativeresult, true)
        @Expect(unativeneg, 1)
    }

    @TestCase
    func testShiftLeft(): Unit {
        var (i8result, i8shift) = 1i8.carryingShl(1)
        @Expect(i8result, false)
        @Expect(i8shift, 2)

        (i8result, i8shift) = 1i8.carryingShl(7)
        @Expect(i8result, false)
        @Expect(i8shift, Int8.Min)

        (i8result, i8shift) = 1i8.carryingShl(8)
        @Expect(i8result, true)
        @Expect(i8shift, 1)

        var (i16result, i16shift) = 1i16.carryingShl(1)
        @Expect(i16result, false)
        @Expect(i16shift, 2)

        (i16result, i16shift) = 1i16.carryingShl(15)
        @Expect(i16result, false)
        @Expect(i16shift, Int16.Min)

        (i16result, i16shift) = 1i16.carryingShl(16)
        @Expect(i16result, true)
        @Expect(i16shift, 1)

        var (i32result, i32shift) = 1i32.carryingShl(1)
        @Expect(i32result, false)
        @Expect(i32shift, 2)

        (i32result, i32shift) = 1i32.carryingShl(31)
        @Expect(i32result, false)
        @Expect(i32shift, Int32.Min)

        (i32result, i32shift) = 1i32.carryingShl(32)
        @Expect(i32result, true)
        @Expect(i32shift, 1)

        var (i64result, i64shift) = 1i64.carryingShl(1)
        @Expect(i64result, false)
        @Expect(i64shift, 2)

        (i64result, i64shift) = 1i64.carryingShl(63)
        @Expect(i64result, false)
        @Expect(i64shift, Int64.Min)

        (i64result, i64shift) = 1i64.carryingShl(64)
        @Expect(i64result, true)
        @Expect(i64shift, 1)

        var (u8result, u8shift) = 1u8.carryingShl(1)
        @Expect(u8result, false)
        @Expect(u8shift, 2)

        (u8result, u8shift) = 1u8.carryingShl(7)
        @Expect(u8result, false)
        @Expect(u8shift, 0x80)

        (u8result, u8shift) = 1u8.carryingShl(8)
        @Expect(u8result, true)
        @Expect(u8shift, 1)

        var (u16result, u16shift) = 1u16.carryingShl(1)
        @Expect(u16result, false)
        @Expect(u16shift, 2)

        (u16result, u16shift) = 1u16.carryingShl(15)
        @Expect(u16result, false)
        @Expect(u16shift, 0x8000)

        (u16result, u16shift) = 1u16.carryingShl(16)
        @Expect(u16result, true)
        @Expect(u16shift, 1)

        var (u32result, u32shift) = 1u32.carryingShl(1)
        @Expect(u32result, false)
        @Expect(u32shift, 2)

        (u32result, u32shift) = 1u32.carryingShl(31)
        @Expect(u32result, false)
        @Expect(u32shift, 0x8000_0000)

        (u32result, u32shift) = 1u32.carryingShl(32)
        @Expect(u32result, true)
        @Expect(u32shift, 1)

        var (u64result, u64shift) = 1u64.carryingShl(1)
        @Expect(u64result, false)
        @Expect(u64shift, 2)

        (u64result, u64shift) = 1u64.carryingShl(63)
        @Expect(u64result, false)
        @Expect(u64shift, 0x8000_0000_0000_0000)

        (u64result, u64shift) = 1u64.carryingShl(64)
        @Expect(u64result, true)
        @Expect(u64shift, 1)

        let bit: UInt64 = if (UInt64(!UIntNative(0)) == UInt64.Max) {
            64
        } else {
            32
        }
        var (inativeresult, inativeshift) = IntNative(1).carryingShl(1)
        @Expect(inativeresult, false)
        @Expect(inativeshift, 2)

        (inativeresult, inativeshift) = IntNative(1).carryingShl(bit)
        @Expect(inativeresult, true)
        @Expect(inativeshift, 1)

        var (unativeresult, unativeshift) = IntNative(1).carryingShl(1)
        @Expect(unativeresult, false)
        @Expect(unativeshift, 2)

        (unativeresult, unativeshift) = IntNative(1).carryingShl(bit)
        @Expect(unativeresult, true)
        @Expect(unativeshift, 1)
    }

    @TestCase
    func testShiftRight(): Unit {
        var (i8result, i8shift) = Int8.Max.carryingShr(0)
        @Expect(i8result, false)
        @Expect(i8shift, Int8.Max)

        (i8result, i8shift) = Int8.Max.carryingShr(7)
        @Expect(i8result, false)
        @Expect(i8shift, 0)

        (i8result, i8shift) = Int8.Max.carryingShr(8)
        @Expect(i8result, true)
        @Expect(i8shift, Int8.Max)

        var (i16result, i16shift) = Int16.Max.carryingShr(0)
        @Expect(i16result, false)
        @Expect(i16shift, Int16.Max)

        (i16result, i16shift) = Int16.Max.carryingShr(15)
        @Expect(i16result, false)
        @Expect(i16shift, 0)

        (i16result, i16shift) = Int16.Max.carryingShr(16)
        @Expect(i16result, true)
        @Expect(i16shift, Int16.Max)

        var (i32result, i32shift) = Int32.Max.carryingShr(0)
        @Expect(i32result, false)
        @Expect(i32shift, Int32.Max)

        (i32result, i32shift) = Int32.Max.carryingShr(31)
        @Expect(i32result, false)
        @Expect(i32shift, 0)

        (i32result, i32shift) = Int32.Max.carryingShr(32)
        @Expect(i32result, true)
        @Expect(i32shift, Int32.Max)

        var (i64result, i64shift) = Int64.Max.carryingShr(0)
        @Expect(i64result, false)
        @Expect(i64shift, Int64.Max)

        (i64result, i64shift) = Int64.Max.carryingShr(63)
        @Expect(i64result, false)
        @Expect(i64shift, 0)

        (i64result, i64shift) = Int64.Max.carryingShr(64)
        @Expect(i64result, true)
        @Expect(i64shift, Int64.Max)

        var (u8result, u8shift) = UInt8.Max.carryingShr(0)
        @Expect(u8result, false)
        @Expect(u8shift, UInt8.Max)

        (u8result, u8shift) = UInt8.Max.carryingShr(7)
        @Expect(u8result, false)
        @Expect(u8shift, 1)

        (u8result, u8shift) = UInt8.Max.carryingShr(8)
        @Expect(u8result, true)
        @Expect(u8shift, UInt8.Max)

        var (u16result, u16shift) = UInt16.Max.carryingShr(0)
        @Expect(u16result, false)
        @Expect(u16shift, UInt16.Max)

        (u16result, u16shift) = UInt16.Max.carryingShr(15)
        @Expect(u16result, false)
        @Expect(u16shift, 1)

        (u16result, u16shift) = UInt16.Max.carryingShr(16)
        @Expect(u16result, true)
        @Expect(u16shift, UInt16.Max)

        var (u32result, u32shift) = UInt32.Max.carryingShr(0)
        @Expect(u32result, false)
        @Expect(u32shift, UInt32.Max)

        (u32result, u32shift) = UInt32.Max.carryingShr(31)
        @Expect(u32result, false)
        @Expect(u32shift, 1)

        (u32result, u32shift) = UInt32.Max.carryingShr(32)
        @Expect(u32result, true)
        @Expect(u32shift, UInt32.Max)

        var (u64result, u64shift) = UInt64.Max.carryingShr(0)
        @Expect(u64result, false)
        @Expect(u64shift, UInt64.Max)

        (u64result, u64shift) = UInt64.Max.carryingShr(63)
        @Expect(u64result, false)
        @Expect(u64shift, 1)

        (u64result, u64shift) = UInt64.Max.carryingShr(64)
        @Expect(u64result, true)
        @Expect(u64shift, UInt64.Max)

        let bit: UInt64 = if (UInt64(!UIntNative(0)) == UInt64.Max) {
            64
        } else {
            32
        }
        var (inativeresult, inativeshift) = IntNative.Max.carryingShr(0)
        @Expect(inativeresult, false)
        @Expect(inativeshift, IntNative.Max)

        (inativeresult, inativeshift) = IntNative.Max.carryingShr(bit - 1)
        @Expect(inativeresult, false)
        @Expect(inativeshift, 0)

        (inativeresult, inativeshift) = IntNative.Max.carryingShr(bit)
        @Expect(inativeresult, true)
        @Expect(inativeshift, IntNative.Max)

        var (unativeresult, unativeshift) = UIntNative.Max.carryingShr(0)
        @Expect(unativeresult, false)
        @Expect(unativeshift, UIntNative.Max)

        (unativeresult, unativeshift) = UIntNative.Max.carryingShr(bit - 1)
        @Expect(unativeresult, false)
        @Expect(unativeshift, 1)

        (unativeresult, unativeshift) = UIntNative.Max.carryingShr(bit)
        @Expect(unativeresult, true)
        @Expect(unativeshift, UIntNative.Max)
    }

    @TestCase
    func testPow(): Unit {
        var i64max: Int64 = Int64.Max
        var (i64result, i64pow) = i64max.carryingPow(2);
        @Expect(i64result, true)
        @Expect(i64pow, 1)

        (i64result, i64pow) = i64max.carryingPow(1)
        @Expect(i64result, false)
        @Expect(i64pow, Int64.Max)

        (i64result, i64pow) = i64max.carryingPow(3)
        @Expect(i64result, true)
        @Expect(i64pow, Int64.Max)
    }
}
