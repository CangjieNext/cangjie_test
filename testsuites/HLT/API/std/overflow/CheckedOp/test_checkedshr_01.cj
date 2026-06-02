/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.overflow.*
import std.math.*

var int8_1: Int8 = Int8.Min
var int8_2: Int8 = Int8.Max
var int8_3: Int8 = 0
var int16_1: Int16 = Int16.Min
var int16_2: Int16 = Int16.Max
var int16_3: Int16 = 0
var int32_1: Int32 = Int32.Min
var int32_2: Int32 = Int32.Max
var int32_3: Int32 = 0
var int64_1: Int64 = Int64.Min
var int64_2: Int64 = Int64.Max
var int64_3: Int64 = 0
var intNat_1: IntNative = IntNative.Min
var intNat_2: IntNative = IntNative.Max
var intNat_3: IntNative = 0
var uint8_1: UInt8 = UInt8.Min
var uint8_2: UInt8 = UInt8.Max
var uint8_3: UInt8 = 100
var uint16_1: UInt16 = UInt16.Min
var uint16_2: UInt16 = UInt16.Max
var uint16_3: UInt16 = 1000
var uint32_1: UInt32 = UInt32.Min
var uint32_2: UInt32 = UInt32.Max
var uint32_3: UInt32 = 10000
var uint64_1: UInt64 = UInt64.Min
var uint64_2: UInt64 = UInt64.Max
var uint64_3: UInt64 = 0
var uintNat_1: UIntNative = UIntNative.Min
var uintNat_2: UIntNative = UIntNative.Max
var uintNat_3: UIntNative = 100000

@Test
class Test_checkedshr_02 {
    @TestCase
    func test_int8_checkedshr_01(): Unit {
        @Expect(int8_2.checkedShr(8), None)
        @Expect(int8_2.checkedShr(127), None)
    }

    @TestCase
    func test_int8_checkedshr_02(): Unit {
        @Expect(int8_1.checkedShr(2).getOrThrow(), -32)
        @Expect(int8_2.checkedShr(1).getOrThrow(), 63)
        @Expect(int8_3.checkedShr(5).getOrThrow(), 0)
    }

    @TestCase
    func test_int16_checkedshr_03(): Unit {
        @Expect(int16_2.checkedShr(16), None)
        @Expect(int16_2.checkedShr(100), None)
    }

    @TestCase
    func test_int16_checkedshr_04(): Unit {
        @Expect(int16_1.checkedShr(6).getOrThrow(), -512)
        @Expect(int16_1.checkedShr(0).getOrThrow(), Int16.Min)
        @Expect(int16_2.checkedShr(15).getOrThrow(), 0)
        @Expect(int16_3.checkedShr(1).getOrThrow(), 0)
    }

    @TestCase
    func test_int32_checkedshr_05(): Unit {
        @Expect(int32_2.checkedShr(32), None)
        @Expect(int32_2.checkedShr(100), None)
    }

    @TestCase
    func test_int32_checkedshr_06(): Unit {
        @Expect(int32_1.checkedShr(6).getOrThrow(), -33554432)
        @Expect(int32_1.checkedShr(0).getOrThrow(), Int32.Min)
        @Expect(int32_2.checkedShr(31).getOrThrow(), 0)
        @Expect(int32_3.checkedShr(1).getOrThrow(), 0)
    }

    @TestCase
    func test_intnative_checkedshr_07(): Unit {
        @Expect(intNat_2.checkedShr(64), None)
        @Expect(intNat_2.checkedShr(100), None)
    }

    @TestCase
    func test_intnative_checkedshr_08(): Unit {
        @Expect(intNat_1.checkedShr(6).getOrThrow(), -144115188075855872)
        @Expect(intNat_1.checkedShr(0).getOrThrow(), IntNative.Min)
        @Expect(intNat_2.checkedShr(63).getOrThrow(), 0)
        @Expect(intNat_3.checkedShr(1).getOrThrow(), 0)
    }

    @TestCase
    func test_uint8_checkedshr_09(): Unit {
        @Expect(uint8_1.checkedShr(8), None)
        @Expect(uint8_2.checkedShr(100), None)
    }

    @TestCase
    func test_uint8_checkedshr_10(): Unit {
        @Expect(uint8_1.checkedShr(6).getOrThrow(), 0)
        @Expect(uint8_1.checkedShr(0).getOrThrow(), UInt8.Min)
        @Expect(uint8_2.checkedShr(7).getOrThrow(), 1)
        @Expect(uint8_3.checkedShr(1).getOrThrow(), 50)
    }

    @TestCase
    func test_uint16_checkedshr_11(): Unit {
        @Expect(uint16_1.checkedShr(16), None)
        @Expect(uint16_2.checkedShr(100), None)
    }

    @TestCase
    func test_uint16_checkedshr_12(): Unit {
        @Expect(uint16_1.checkedShr(6).getOrThrow(), 0)
        @Expect(uint16_1.checkedShr(0).getOrThrow(), UInt16.Min)
        @Expect(uint16_2.checkedShr(15).getOrThrow(), 1)
        @Expect(uint16_3.checkedShr(1).getOrThrow(), 500)
    }

    @TestCase
    func test_uint32_checkedshr_13(): Unit {
        @Expect(uint32_1.checkedShr(32), None)
        @Expect(uint32_2.checkedShr(100), None)
    }

    @TestCase
    func test_uint32_checkedshr_14(): Unit {
        @Expect(uint32_1.checkedShr(6).getOrThrow(), 0)
        @Expect(uint32_1.checkedShr(0).getOrThrow(), UInt32.Min)
        @Expect(uint32_2.checkedShr(31).getOrThrow(), 1)
        @Expect(uint32_3.checkedShr(1).getOrThrow(), 5000)
    }

    @TestCase
    func test_uintnative_checkedshr_15(): Unit {
        @Expect(uintNat_1.checkedShr(64), None)
        @Expect(uintNat_2.checkedShr(100), None)
    }

    @TestCase
    func test_uintnative_checkedshr_16(): Unit {
        @Expect(uintNat_1.checkedShr(6).getOrThrow(), 0)
        @Expect(uintNat_1.checkedShr(0).getOrThrow(), UIntNative.Min)
        @Expect(uintNat_2.checkedShr(63).getOrThrow(), 1)
        @Expect(uintNat_3.checkedShr(1).getOrThrow(), 50000)
    }

    @TestCase
    func test_int64_checkedshr_17(): Unit {
        @Expect(int64_2.checkedShr(64), None)
        @Expect(int64_2.checkedShr(100), None)
    }

    @TestCase
    func test_int64_checkedshr_18(): Unit {
        @Expect(int64_1.checkedShr(6).getOrThrow(), -144115188075855872)
        @Expect(int64_1.checkedShr(0).getOrThrow(), Int64.Min)
        @Expect(int64_2.checkedShr(63).getOrThrow(),0)
        @Expect(int64_3.checkedShr(1).getOrThrow(), 0)
    }

    @TestCase
    func test_uint64_checkedshr_19(): Unit {
        @Expect(uint64_1.checkedShr(64), None)
        @Expect(uint64_2.checkedShr(100), None)
    }

    @TestCase
    func test_uint32_checkedshr_20(): Unit {
        @Expect(uint64_1.checkedShr(6).getOrThrow(), 0)
        @Expect(uint64_1.checkedShr(0).getOrThrow(), UInt64.Min)
        @Expect(uint64_2.checkedShr(63).getOrThrow(), 1)
        @Expect(uint64_3.checkedShr(1).getOrThrow(), 0)
    }
}
