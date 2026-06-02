/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.encoding.json.stream.*
import std.io.*
import std.math.*

@Test
class Test_fromjson_uint_02 {
    @TestCase
    func test_uint8_min_01(): Unit {
        let jsonStr = ##"0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt8.fromJson(reader), 0)
    }

    @TestCase
    func test_int8_max_02(): Unit {
        let jsonStr = ##"255"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt8.fromJson(reader), 255)
    }

    @TestCase
    func test_uint8_03(): Unit {
        let jsonStr = ##"0.0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt8.fromJson(reader), 0)
    }

    @TestCase
    func test_uint8_04(): Unit {
        let jsonStr = ##"1.8"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt8.fromJson(reader), 1)
    }

    @TestCase
    func test_uint8_05(): Unit {
        let jsonStr = ##"256"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        try {
            UInt8.fromJson(reader)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message,"The next number is out of range for UInt8.")
        }
    }

    @TestCase
    func test_uint16_min_06(): Unit {
        let jsonStr = ##"0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt16.fromJson(reader), 0)
    }

    @TestCase
    func test_uint16_max_07(): Unit {
        let jsonStr = ##"65535"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt16.fromJson(reader), 65535)
    }

    @TestCase
    func test_uint16_08(): Unit {
        let jsonStr = ##"20.2"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt16.fromJson(reader), 20)
    }

    @TestCase
    func test_uint16_09(): Unit {
        let jsonStr = ##"0.0000"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt16.fromJson(reader), 0)
    }

    @TestCase
    func test_uint16_10(): Unit {
        let jsonStr = ##"-1"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        try {
            UInt16.fromJson(reader)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message,"The next number is out of range for UInt16.")
        }
    }

    @TestCase
    func test_uint32_min_11(): Unit {
        let jsonStr = ##"0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt32.fromJson(reader), 0)
    }

    @TestCase
    func test_uint32_max_12(): Unit {
        let jsonStr = ##"4294967295"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt32.fromJson(reader), UInt32.Max)
    }

    @TestCase
    func test_uint32_13(): Unit {
        let jsonStr = ##"12.989"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UInt32.fromJson(reader), 12)
    }

    @TestCase
    func test_uint32_14(): Unit {
        let jsonStr = ##"0.0000"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Int32.fromJson(reader), 0)
    }

    @TestCase
    func test_uint32_15(): Unit {
        let jsonStr = ##"10000000000000"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        try {
            UInt32.fromJson(reader)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message,"The next number is out of range for UInt32.")
        }
    }

    @TestCase
    func test_uint32_16(): Unit {
        let jsonStr = ##"-1"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        try {
            UInt32.fromJson(reader)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message,"The next number is out of range for UInt32.")
        }
    }

    @TestCase
    func test_uintnative_min_17(): Unit {
        let jsonStr = ##"0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UIntNative.fromJson(reader), UIntNative.Min)
    }

    @TestCase
    func test_intnative_max_18(): Unit {
        let jsonStr = ##"18446744073709551615"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UIntNative.fromJson(reader), UIntNative.Max)
    }

    @TestCase
    func test_Uintnative_19(): Unit {
        let jsonStr = ##"111111.8"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UIntNative.fromJson(reader), 111111)
    }

    @TestCase
    func test_Uintnative_20(): Unit {
        let jsonStr = ##"0.0000"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(UIntNative.fromJson(reader), 0)
    }

    @TestCase
    func test_uintnative_21(): Unit {
        let jsonStr = ##"1000000000000000000000000000000"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        try {
            UIntNative.fromJson(reader)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message,"The next number is out of range for UIntNative.")
        }
    }

    @TestCase
    func test_intnative_22(): Unit {
        let jsonStr = ##"-1"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        try {
            UIntNative.fromJson(reader)
            @Expect(false)
        } catch (e: OverflowException) {
            @Expect(e.message,"The next number is out of range for UIntNative.")
        }
    }
}
