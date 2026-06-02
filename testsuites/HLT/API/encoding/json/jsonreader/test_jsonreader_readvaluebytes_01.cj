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
class Test_jsonreader_readvaluebytes_01 {
    @TestCase
    func test_jsonreader_readvaluebytes_01(): Unit {
        var bas = ByteBuffer()
        var reader = JsonReader(bas)
        @Expect(reader.readValueBytes(), [])
    }

    @TestCase
    func test_jsonreader_readvaluebytes_02(): Unit {
        let jsonStr = ##"{"key1": null}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        var arr: Array<Byte> = [123, 34, 107, 101, 121, 49, 34, 58, 32, 110, 117, 108, 108, 125]
        @Expect(reader.readValueBytes(), arr)
    }

    @TestCase
    func test_jsonreader_readvaluebytes_03(): Unit {
        let jsonStr = ##"14stst,163"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        var arr: Array<Byte> = [49, 52, 115, 116, 115, 116]
        @Expect(reader.readValueBytes(), arr)
    }

    @TestCase
    func test_jsonreader_readvaluebytes_04(): Unit {
        let jsonStr = ##"14stst}163"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        var arr: Array<Byte> = [49, 52, 115, 116, 115, 116]
        @Expect(reader.readValueBytes(), arr)
    }

    @TestCase
    func test_jsonreader_readvaluebytes_05(): Unit {
        let jsonStr = ##"14stst]163"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        var arr: Array<Byte> = [49, 52, 115, 116, 115, 116]
        @Expect(reader.readValueBytes(), arr)
    }

    @TestCase
    func test_jsonreader_readvaluebytes_06(): Unit {
        let jsonStr = ##"[14stst]163"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        var arr: Array<Byte> = [91, 49, 52, 115, 116, 115, 116, 93]
        @Expect(reader.readValueBytes(), arr)
    }

    @TestCase
    func test_jsonreader_readvaluebytes_07(): Unit {
        let jsonStr = ##"}14stst163"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        let e = @AssertThrows[IllegalStateException](reader.readValueBytes())
        @Expect(e.message.contains("Character not expected"))
    }

    @TestCase
    func test_jsonreader_readvaluebytes_08(): Unit {
        let jsonStr = ##"]14stst163"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        let e = @AssertThrows[IllegalStateException](reader.readValueBytes())
        @Expect(e.message.contains("Character not expected"))
    }
}
