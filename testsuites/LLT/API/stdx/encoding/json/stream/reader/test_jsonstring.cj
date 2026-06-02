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
public class JsonStringTest {
    @TestCase
    func jsonstring(): Unit {
        let jsonStr = ##""abc""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "abc")
    }

    @TestCase
    func jsonstringOption(): Unit {
        let jsonStr = ##""abc""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<Option<String>>(), "abc")
    }

    @TestCase
    func jsonvalue2string(): Unit {
        let jsonStr = ##"[1,null, {"name": true}, false
        , "abc",12345.54 ,"\"abc\"",1 ]"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        reader.startArray()
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<String>(), "1")

        @Expect(reader.peek(), JsonToken.JsonNull)
        @Expect(reader.readValue<String>(), "null")

        reader.startObject()
        @Expect(reader.readName(), "name")
        @Expect(reader.readValue<String>(), "true")
        reader.endObject()

        @Expect(reader.peek(), JsonToken.JsonBool)
        @Expect(reader.readValue<String>(), "false")

        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "abc")

        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<String>(), "12345.54")

        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "\"abc\"")

        @Expect(reader.readValue<String>(), "1")
        reader.endArray()
    }

    @TestCase
    func jsonvalue2string1(): Unit {
        let jsonStr = "123"
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.readValue<String>(), "123")
    }

    @TestCase
    func jsonstringEmpty(): Unit {
        let jsonStr = ##""""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "")
    }

    @TestCase
    func jsonstringLongstr(): Unit {
        var jsonStr = ##"""##
        var longStr = ##""##
        for (_ in 0..1000) {
            longStr += ##"aaaaabbbbb"##
        }
        jsonStr += longStr
        jsonStr += ##"""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), longStr)
    }

    @TestCase
    func jsonstringEscape1(): Unit {
        let jsonStr = ##""\" \\ \/ \b \f \n \r \t \u0000""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "\" \\ / \b \f \n \r \t \0")
    }

    @TestCase
    func jsonstringEscape2(): Unit {
        let jsonStr = ##""\nabc\nabc\n""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "\nabc\nabc\n")
    }

    @TestCase
    func jsonstringEscape1Byte(): Unit {
        let jsonStr = ##""\u0041""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "A")
    }

    @TestCase
    func jsonstringEscape2Byte(): Unit {
        let jsonStr = ##""\u0100""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "Ā")
    }

    @TestCase
    func jsonstringEscape3Byte(): Unit {
        let jsonStr = ##""\u4e2d""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "中")
    }

    @TestCase
    func jsonstringEscap4Byte(): Unit {
        let jsonStr = ##""\uD834\uDd1e""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "𝄞")
    }

    @TestCase
    func jsonstringError(): Unit {
        let jsonStr = ##"""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        try {
            reader.readValue<String>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "The JSON stream ends at an incorrect location.")
        }
    }

    @TestCase
    func jsonstringEscapError1(): Unit {
        let jsonStr = ##""\u000z""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        try {
            reader.readValue<String>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Illegal escape character.")
        }
    }

    @TestCase
    func jsonstringEscapError2(): Unit {
        let jsonStr = ##""\uD834abcdef""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonString)
        try {
            reader.readValue<String>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Illegal escape character.")
        }
    }

    @TestCase
    func jsonstringAllNullByte(): Unit {
        let jsonStr = ##"    "##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), None)
    }

    @TestCase
    func jsonstringRejectUnquoted(): Unit {
        let jsonStr = ##"abc"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        try {
            reader.readValue<String>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Character not expected: 'a'.")
        }
    }
}
