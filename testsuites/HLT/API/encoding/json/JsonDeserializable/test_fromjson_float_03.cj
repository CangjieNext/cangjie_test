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
class Test_fromjson_float_01 {
    @TestCase
    func test_float16_01(): Unit {
        let jsonStr = ##"-9.8132312321"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Float16.fromJson(reader), Float16(-9.8132312321))
    }

    @TestCase
    func test_float16_02(): Unit {
        let jsonStr = ##"9.8132312321"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Float16.fromJson(reader), Float16(9.8132312321))
    }

    @TestCase
    func test_float16_03(): Unit {
        let jsonStr = ##"0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Float16.fromJson(reader), Float16(0))
    }

    @TestCase
    func test_float16_04(): Unit {
        let jsonStr = ##"0.00000"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Float16.fromJson(reader), Float16(0.00000))
    }

    @TestCase
    func test_float16_05(): Unit {
        let jsonStr = ##"100000000000000000000000000000000000000000000000000000000000.1"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Float16.fromJson(reader), Float16.Inf)
    }

    @TestCase
    func test_float32_06(): Unit {
        let jsonStr = ##"-9.8132312321132"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Float32.fromJson(reader), Float32(-9.8132312321132))
    }

    @TestCase
    func test_float32_07(): Unit {
        let jsonStr = ##"9.81323123211435"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Float32.fromJson(reader), Float32(9.81323123211435))
    }

    @TestCase
    func test_float32_08(): Unit {
        let jsonStr = ##"0"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Float32.fromJson(reader), Float32(0))
    }

    @TestCase
    func test_float32_09(): Unit {
        let jsonStr = ##"0.000000000000000000"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Float32.fromJson(reader), Float32(0.000000000000000000))
    }

    @TestCase
    func test_float32_10(): Unit {
        let jsonStr = ##"12.2222222222222222222222"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(Float32.fromJson(reader), Float32(12.2222222222222222222222))
    }
}
