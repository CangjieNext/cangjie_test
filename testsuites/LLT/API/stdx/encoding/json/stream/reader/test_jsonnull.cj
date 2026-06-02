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
public class JsonNullTest {
    @TestCase
    func jsonnull(): Unit {
        let jsonStr = ##"null"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNull)
        @Expect(reader.readValue<Option<String>>(), Option<String>.None)
    }

    @TestCase
    func jsonnullInarray(): Unit {
        let jsonStr = ##"[null]"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.BeginArray)
        reader.startArray()
        @Expect(reader.peek(), JsonToken.JsonNull)
        @Expect(reader.readValue<Option<String>>(), Option<String>.None)
        @Expect(reader.peek(), JsonToken.EndArray)
        reader.endArray()
    }

    @TestCase
    func jsonnullInobject(): Unit {
        let jsonStr = ##"{"key1": null}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.BeginObject)
        reader.startObject()
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "key1")
        @Expect(reader.peek(), JsonToken.JsonNull)
        @Expect(reader.readValue<Option<String>>(), Option<String>.None)
        @Expect(reader.peek(), JsonToken.EndObject)
        reader.endObject()
    }

    @TestCase
    func jsonnullInvalid(): Unit {
        let jsonStr = ##"n"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.JsonNull)
        try {
            reader.readValue<Option<String>>()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "The JSON stream ends at an incorrect location.")
        }
    }
}
