/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
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
class Test_checkedshl_01 {
    @TestCase
    func test_int8_checkedshl_01(): Unit {
        @Expect(int8_2.checkedShl(8), None)
        @Expect(int8_2.checkedShl(127), None)
    }

    @TestCase
    func test_int8_checkedshl_02(): Unit {
        @Expect(int8_1.checkedShl(2).getOrThrow(), 0)
        @Expect(int8_2.checkedShl(1).getOrThrow(), -2)
        @Expect(int8_3.checkedShl(5).getOrThrow(), 0)
    }

    @TestCase
    func test_int16_checkedshl_03(): Unit {
        @Expect(int16_2.checkedShl(16), None)
        @Expect(int16_2.checkedShl(100), None)
    }

    @TestCase
    func test_int16_checkedshl_04(): Unit {
        @Expect(int16_1.checkedShl(6).getOrThrow(), 0)
        @Expect(int16_1.checkedShl(0).getOrThrow(), Int16.Min)
        @Expect(int16_2.checkedShl(15).getOrThrow(), -32768)
        @Expect(int16_3.checkedShl(1).getOrThrow(), 0)
    }

    @TestCase
    func test_int32_checkedshl_05(): Unit {
        @Expect(int32_2.checkedShl(32), None)
        @Expect(int32_2.checkedShl(100), None)
    }

    @TestCase
    func test_int32_checkedshl_06(): Unit {
        @Expect(int32_1.checkedShl(6).getOrThrow(), 0)
        @Expect(int32_1.checkedShl(0).getOrThrow(), Int32.Min)
        @Expect(int32_2.checkedShl(31).getOrThrow(), -2147483648)
        @Expect(int32_3.checkedShl(1).getOrThrow(), 0)
    }

    @TestCase
    func test_intnative_checkedshl_07(): Unit {
        @Expect(intNat_2.checkedShl(64), None)
        @Expect(intNat_2.checkedShl(100), None)
    }

    @TestCase
    func test_intnative_checkedshl_08(): Unit {
        @Expect(intNat_1.checkedShl(6).getOrThrow(), 0)
        @Expect(intNat_1.checkedShl(0).getOrThrow(), IntNative.Min)
        @Expect(intNat_2.checkedShl(63).getOrThrow(), -9223372036854775808)
        @Expect(intNat_3.checkedShl(1).getOrThrow(), 0)
    }

    @TestCase
    func test_uint8_checkedshl_09(): Unit {
        @Expect(uint8_1.checkedShl(8), None)
        @Expect(uint8_2.checkedShl(100), None)
    }

    @TestCase
    func test_uint8_checkedshl_10(): Unit {
        @Expect(uint8_1.checkedShl(6).getOrThrow(), 0)
        @Expect(uint8_1.checkedShl(0).getOrThrow(), UInt8.Min)
        @Expect(uint8_2.checkedShl(7).getOrThrow(), 128)
        @Expect(uint8_3.checkedShl(1).getOrThrow(), 200)
    }

    @TestCase
    func test_uint16_checkedshl_11(): Unit {
        @Expect(uint16_1.checkedShl(16), None)
        @Expect(uint16_2.checkedShl(100), None)
    }

    @TestCase
    func test_uint16_checkedshl_12(): Unit {
        @Expect(uint16_1.checkedShl(6).getOrThrow(), 0)
        @Expect(uint16_1.checkedShl(0).getOrThrow(), UInt16.Min)
        @Expect(uint16_2.checkedShl(15).getOrThrow(), 32768)
        @Expect(uint16_3.checkedShl(1).getOrThrow(), 2000)
    }

    @TestCase
    func test_uint32_checkedshl_13(): Unit {
        @Expect(uint32_1.checkedShl(32), None)
        @Expect(uint32_2.checkedShl(100), None)
    }

    @TestCase
    func test_uint32_checkedshl_14(): Unit {
        @Expect(uint32_1.checkedShl(6).getOrThrow(), 0)
        @Expect(uint32_1.checkedShl(0).getOrThrow(), UInt32.Min)
        @Expect(uint32_2.checkedShl(31).getOrThrow(), 2147483648)
        @Expect(uint32_3.checkedShl(1).getOrThrow(), 20000)
    }

    @TestCase
    func test_uintnative_checkedshl_15(): Unit {
        @Expect(uintNat_1.checkedShl(64), None)
        @Expect(uintNat_2.checkedShl(100), None)
    }

    @TestCase
    func test_uintnative_checkedshl_16(): Unit {
        @Expect(uintNat_1.checkedShl(6).getOrThrow(), 0)
        @Expect(uintNat_1.checkedShl(0).getOrThrow(), UIntNative.Min)
        @Expect(uintNat_2.checkedShl(63).getOrThrow(), 9223372036854775808)
        @Expect(uintNat_3.checkedShl(1).getOrThrow(), 200000)
    }

    @TestCase
    func test_int64_checkedshl_17(): Unit {
        @Expect(int64_2.checkedShl(64), None)
        @Expect(int64_2.checkedShl(100), None)
    }

    @TestCase
    func test_int64_checkedshl_18(): Unit {
        @Expect(int64_1.checkedShl(6).getOrThrow(), 0)
        @Expect(int64_1.checkedShl(0).getOrThrow(), Int64.Min)
        @Expect(int64_2.checkedShl(63).getOrThrow(),-9223372036854775808)
        @Expect(int64_3.checkedShl(1).getOrThrow(), 0)
    }

    @TestCase
    func test_uint64_checkedshl_19(): Unit {
        @Expect(uint64_1.checkedShl(64), None)
        @Expect(uint64_2.checkedShl(100), None)
    }

    @TestCase
    func test_uint32_checkedshl_20(): Unit {
        @Expect(uint64_1.checkedShl(6).getOrThrow(), 0)
        @Expect(uint64_1.checkedShl(0).getOrThrow(), UInt64.Min)
        @Expect(uint64_2.checkedShl(63).getOrThrow(), 9223372036854775808)
        @Expect(uint64_3.checkedShl(1).getOrThrow(), 0)
    }
}
