/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import stdx.encoding.json.stream.*
import std.io.*

@Test
public class JsonBoolTest {
    @TestCase
    func jsonboolTrue(): Unit {
        let jsonStr = ##"true"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonBool)
        @Expect(reader.readValue<Bool>(), true)
    }

    @TestCase
    func jsonboolTrueOption(): Unit {
        let jsonStr = ##"true"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonBool)
        @Expect(reader.readValue<Option<Bool>>(), true)
    }

    @TestCase
    func jsonboolFalse(): Unit {
        let jsonStr = ##"false"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonBool)
        @Expect(reader.readValue<Bool>(), false)
    }

    @TestCase
    func jsonboolInvalidTrue1(): Unit {
        let jsonStr = ##"t"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonBool)
        try {
            reader.readValue<Bool>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "The JSON stream ends at an incorrect location.")
        }
    }

    @TestCase
    func jsonboolInvalidTrue2(): Unit {
        let jsonStr = ##"tttt"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonBool)
        try {
            reader.readValue<Bool>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Failed to read JSON bool.")
        }
    }

    @TestCase
    func jsonboolInvalidFalse1(): Unit {
        let jsonStr = ##"f"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonBool)
        try {
            reader.readValue<Bool>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "The JSON stream ends at an incorrect location.")
        }
    }

    @TestCase
    func jsonboolInvalidFalse2(): Unit {
        let jsonStr = ##"fffff"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonBool)
        try {
            reader.readValue<Bool>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Failed to read JSON bool.")
        }
    }

    @TestCase
    func jsonboolEmpty(): Unit {
        let jsonStr = ##""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), None)
        try {
            reader.readValue<Bool>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "The JSON stream ends at an incorrect location.")
        }
    }
}
