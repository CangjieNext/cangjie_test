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

import std.io.*
import stdx.encoding.json.stream.*

class writer <: ToString {
    var input = ByteBuffer()
    var jw = JsonWriter(input)

    public func toString(): String {
        jw.flush()
        return String.fromUtf8(readToEnd(input))
    }
}

@Test
class Test_tojson_uint_02 {
    @TestCase
    func test_uint8_min_01(): Unit {
        var w = writer()
        let num: UInt8 = 0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_uint8_max_02(): Unit {
        let w = writer()
        let num: UInt8 = 255
        num.toJson(w.jw)
        @Expect(w.toString(), "255")
    }

    @TestCase
    func test_uint8_03(): Unit {
        let w = writer()
        let num: UInt8 = -0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_uint8_04(): Unit {
        let w = writer()
        let num: UInt8 = 100
        num.toJson(w.jw)
        @Expect(w.toString(), "100")
    }

    @TestCase
    func test_uint16_min_05(): Unit {
        var w = writer()
        let num: UInt16 = 0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_uint16_max_06(): Unit {
        let w = writer()
        let num: UInt16 = 65535
        num.toJson(w.jw)
        @Expect(w.toString(), "65535")
    }

    @TestCase
    func test_uint16_07(): Unit {
        let w = writer()
        let num: UInt16 = -0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_uint16_08(): Unit {
        let w = writer()
        let num: UInt16 = 10000
        num.toJson(w.jw)
        @Expect(w.toString(), "10000")
    }

    @TestCase
    func test_uint32_min_09(): Unit {
        var w = writer()
        let num: UInt32 = 0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_uint32_max_10(): Unit {
        let w = writer()
        let num: UInt32 = 4294967295
        num.toJson(w.jw)
        @Expect(w.toString(), "4294967295")
    }

    @TestCase
    func test_uint32_11(): Unit {
        let w = writer()
        let num: UInt32 = -0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_uint32_12(): Unit {
        let w = writer()
        let num: UInt32 = 100000
        num.toJson(w.jw)
        @Expect(w.toString(), "100000")
    }

    @TestCase
    func test_uintnative_min_13(): Unit {
        var w = writer()
        let num: UIntNative = 0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_uintnative_max_14(): Unit {
        let w = writer()
        let num: UIntNative = 18446744073709551615
        num.toJson(w.jw)
        @Expect(w.toString(), "18446744073709551615")
    }

    @TestCase
    func test_uintnative_15(): Unit {
        let w = writer()
        let num: UIntNative = -0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_uintnative_16(): Unit {
        let w = writer()
        let num: UIntNative = 17446744073709551615
        num.toJson(w.jw)
        @Expect(w.toString(), "17446744073709551615")
    }
}
