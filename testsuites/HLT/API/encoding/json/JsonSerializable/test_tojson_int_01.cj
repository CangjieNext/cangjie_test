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
class Test_tojson_int_01 {
    @TestCase
    func test_int8_min_01(): Unit {
        var w = writer()
        let num: Int8 = -128
        num.toJson(w.jw)
        @Expect(w.toString(), "-128")
    }

    @TestCase
    func test_int8_max_02(): Unit {
        let w = writer()
        let num: Int8 = 127
        num.toJson(w.jw)
        @Expect(w.toString(), "127")
    }

    @TestCase
    func test_int8_03(): Unit {
        let w = writer()
        let num: Int8 = -0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_int8_04(): Unit {
        let w = writer()
        let num: Int8 = 0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_int16_min_05(): Unit {
        var w = writer()
        let num: Int16 = -32768
        num.toJson(w.jw)
        @Expect(w.toString(), "-32768")
    }

    @TestCase
    func test_int16_max_06(): Unit {
        let w = writer()
        let num: Int16 = 32767
        num.toJson(w.jw)
        @Expect(w.toString(), "32767")
    }

    @TestCase
    func test_int16_07(): Unit {
        let w = writer()
        let num: Int16 = -0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_int16_08(): Unit {
        let w = writer()
        let num: Int16 = 0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_int32_min_09(): Unit {
        var w = writer()
        let num: Int32 = -2147483648
        num.toJson(w.jw)
        @Expect(w.toString(), "-2147483648")
    }

    @TestCase
    func test_int32_max_10(): Unit {
        let w = writer()
        let num: Int32 = 2147483647
        num.toJson(w.jw)
        @Expect(w.toString(), "2147483647")
    }

    @TestCase
    func test_int32_11(): Unit {
        let w = writer()
        let num: Int32 = -0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_int32_12(): Unit {
        let w = writer()
        let num: Int32 = 0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_intnative_min_13(): Unit {
        var w = writer()
        let num: IntNative = -9223372036854775808
        num.toJson(w.jw)
        @Expect(w.toString(), "-9223372036854775808")
    }

    @TestCase
    func test_intnative_max_14(): Unit {
        let w = writer()
        let num: IntNative = 9223372036854775807
        num.toJson(w.jw)
        @Expect(w.toString(), "9223372036854775807")
    }

    @TestCase
    func test_intnative_15(): Unit {
        let w = writer()
        let num: IntNative = -0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_intnative_16(): Unit {
        let w = writer()
        let num: IntNative = 0
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }
}
