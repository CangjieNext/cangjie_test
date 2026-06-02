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
class Test_throwingshr_02 {
    @TestCase
    func test_int8_throwingshr_01(): Unit {
        try {
            int8_2.throwingShr(8)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        try {
            int8_2.throwingShr(127)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func test_int8_throwingshr_02(): Unit {
        @Expect(int8_1.throwingShr(2), -32)
        @Expect(int8_2.throwingShr(1), 63)
        @Expect(int8_3.throwingShr(5), 0)
    }

    @TestCase
    func test_int16_throwingshr_03(): Unit {
        try {
            int16_2.throwingShr(16)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        try {
            int16_2.throwingShr(100)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func test_int16_throwingshr_04(): Unit {
        @Expect(int16_1.throwingShr(6), -512)
        @Expect(int16_1.throwingShr(0), Int16.Min)
        @Expect(int16_2.throwingShr(15), 0)
        @Expect(int16_3.throwingShr(1), 0)
    }

    @TestCase
    func test_int32_throwingshr_05(): Unit {
        try {
            int32_2.throwingShr(32)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        try {
            int32_2.throwingShr(100)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func test_int32_throwingshr_06(): Unit {
        @Expect(int32_1.throwingShr(6), -33554432)
        @Expect(int32_1.throwingShr(0), Int32.Min)
        @Expect(int32_2.throwingShr(31), 0)
        @Expect(int32_3.throwingShr(1), 0)
    }

    @TestCase
    func test_intnative_throwingshr_07(): Unit {
        try {
            intNat_2.throwingShr(64)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        try {
            intNat_2.throwingShr(100)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func test_intnative_throwingshr_08(): Unit {
        @Expect(intNat_1.throwingShr(6), -144115188075855872)
        @Expect(intNat_1.throwingShr(0), IntNative.Min)
        @Expect(intNat_2.throwingShr(63), 0)
        @Expect(intNat_3.throwingShr(1), 0)
    }

    @TestCase
    func test_uint8_throwingshr_09(): Unit {
        try {
            uint8_1.throwingShr(8)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        try {
            uint8_2.throwingShr(100)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func test_uint8_throwingshr_10(): Unit {
        @Expect(uint8_1.throwingShr(6), 0)
        @Expect(uint8_1.throwingShr(0), UInt8.Min)
        @Expect(uint8_2.throwingShr(7), 1)
        @Expect(uint8_3.throwingShr(1), 50)
    }

    @TestCase
    func test_uint16_throwingshr_11(): Unit {
        try {
            uint16_1.throwingShr(16)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        try {
            uint16_2.throwingShr(100)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func test_uint16_throwingshr_12(): Unit {
        @Expect(uint16_1.throwingShr(6), 0)
        @Expect(uint16_1.throwingShr(0), UInt16.Min)
        @Expect(uint16_2.throwingShr(15), 1)
        @Expect(uint16_3.throwingShr(1), 500)
    }

    @TestCase
    func test_uint32_throwingshr_13(): Unit {
        try {
            uint32_1.throwingShr(32)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        try {
            uint32_2.throwingShr(100)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func test_uint32_throwingshr_14(): Unit {
        @Expect(uint32_1.throwingShr(6), 0)
        @Expect(uint32_1.throwingShr(0), UInt32.Min)
        @Expect(uint32_2.throwingShr(31), 1)
        @Expect(uint32_3.throwingShr(1), 5000)
    }

    @TestCase
    func test_uintnative_throwingshr_15(): Unit {
        try {
            uintNat_1.throwingShr(64)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }

        try {
            uintNat_2.throwingShr(100)
            @Expect(false)
        } catch (e: OvershiftException) {
            @Expect(e.message, "The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func test_uintnative_throwingshr_16(): Unit {
        @Expect(uintNat_1.throwingShr(6), 0)
        @Expect(uintNat_1.throwingShr(0), UIntNative.Min)
        @Expect(uintNat_2.throwingShr(63), 1)
        @Expect(uintNat_3.throwingShr(1), 50000)
    }

    @TestCase
    func test_int64_throwingshr_17(): Unit {
        @Expect(int64_2.throwingShr(63), 0)
        try {
            int64_2.throwingShr(100)
            @Expect(1, -9223372036854775808)
        } catch (e: OvershiftException) {
            @Expect(e.toString(),"OvershiftException: The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func test_int64_throwingshr_18(): Unit {
        @Expect(int64_1.throwingShr(6), -144115188075855872)
        @Expect(int64_1.throwingShr(0), Int64.Min)
        @Expect(int64_2.throwingShr(63),0)
        @Expect(int64_3.throwingShr(1), 0)
    }

    @TestCase
    func test_uint64_throwingshr_19(): Unit {
        @Expect(uint64_1.throwingShr(63), 0)
        try {
            uint64_2.throwingShr(100)
        } catch (e: OvershiftException) {
            @Expect(e.toString(),"OvershiftException: The right operand must be less than the number of bits in the left operand.")
        }
    }

    @TestCase
    func test_uint32_throwingshr_20(): Unit {
        @Expect(uint64_1.throwingShr(6), 0)
        @Expect(uint64_1.throwingShr(0), UInt64.Min)
        @Expect(uint64_2.throwingShr(63), 1)
        @Expect(uint64_3.throwingShr(1), 0)
    }
}
