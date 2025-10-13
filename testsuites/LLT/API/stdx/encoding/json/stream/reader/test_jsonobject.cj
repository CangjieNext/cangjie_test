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
import std.collection.*

@Test
public class JsonObjectTest {
    @TestCase
    func jsonobjectEmpty(): Unit {
        let jsonStr = ##"{}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.BeginObject)
        reader.startObject()
        @Expect(reader.peek(), JsonToken.EndObject)
        reader.endObject()
    }

    @TestCase
    func jsonobject(): Unit {
        let jsonStr = ##"{"null\u0021": null, "bool": true, "float": 123.456e3, "string": "\uD834\uDd1e", "array": [123, false], "object": {"key1": " ", "key2": "\\a"}}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.BeginObject)
        reader.startObject()
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "null!")
        @Expect(reader.peek(), JsonToken.JsonNull)
        @Expect(reader.readValue<Option<String>>(), None)
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "bool")
        @Expect(reader.peek(), JsonToken.JsonBool)
        @Expect(reader.readValue<Bool>(), true)
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "float")
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float64>(), 123456.0)
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "string")
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "𝄞")
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "array")
        @Expect(reader.peek(), JsonToken.BeginArray)
        reader.startArray()
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 123)
        @Expect(reader.peek(), JsonToken.JsonBool)
        @Expect(reader.readValue<Bool>(), false)
        @Expect(reader.peek(), JsonToken.EndArray)
        reader.endArray()
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "object")
        @Expect(reader.peek(), JsonToken.BeginObject)
        reader.startObject()
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "key1")
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), " ")
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "key2")
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "\\a")
        @Expect(reader.peek(), JsonToken.EndObject)
        reader.endObject()
        @Expect(reader.peek(), JsonToken.EndObject)
        reader.endObject()
    }

    @TestCase
    func jsonobjectNopeek(): Unit {
        let jsonStr = ##"{"null": null, "bool": true, "float": 123.456e3, "string": "\uD834\uDd1e", "array": [123, false], "object": {"key1": " ", "key2": "\\a"}}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        reader.startObject()
        @Expect(reader.readName(), "null")
        @Expect(reader.readValue<Option<String>>(), None)
        @Expect(reader.readName(), "bool")
        @Expect(reader.readValue<Bool>(), true)
        @Expect(reader.readName(), "float")
        @Expect(reader.readValue<Float64>(), 123456.0)
        @Expect(reader.readName(), "string")
        @Expect(reader.readValue<String>(), "𝄞")
        @Expect(reader.readName(), "array")
        reader.startArray()
        @Expect(reader.readValue<UInt64>(), UInt64(123))
        @Expect(reader.readValue<Bool>(), false)
        reader.endArray()
        @Expect(reader.readName(), "object")
        reader.startObject()
        @Expect(reader.readName(), "key1")
        @Expect(reader.readValue<String>(), " ")
        @Expect(reader.readName(), "key2")
        @Expect(reader.readValue<String>(), "\\a")
        reader.endObject()
        reader.endObject()
    }

    @TestCase
    func jsonobject2(): Unit {
        let jsonStr = ##"{"null": null, "bool": true, "float": 123.456e3, "string": "\uD834\uDd1e", "array": [[123], false], "object": {"key1": {"key2": ""}, "key3": "\\a"}}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.BeginObject)
        reader.startObject()
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "null")
        @Expect(reader.peek(), JsonToken.JsonNull)
        @Expect(reader.readValue<Option<String>>(), None)
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "bool")
        @Expect(reader.peek(), JsonToken.JsonBool)
        @Expect(reader.readValue<Bool>(), true)
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "float")
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Float64>(), 123456.0)
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "string")
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "𝄞")
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "array")
        @Expect(reader.peek(), JsonToken.BeginArray)
        reader.startArray()
        @Expect(reader.peek(), JsonToken.BeginArray)
        reader.startArray()
        @Expect(reader.peek(), JsonToken.JsonNumber)
        @Expect(reader.readValue<Int64>(), 123)
        @Expect(reader.peek(), JsonToken.EndArray)
        reader.endArray()
        @Expect(reader.peek(), JsonToken.JsonBool)
        @Expect(reader.readValue<Bool>(), false)
        @Expect(reader.peek(), JsonToken.EndArray)
        reader.endArray()
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "object")
        @Expect(reader.peek(), JsonToken.BeginObject)
        reader.startObject()
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "key1")
        @Expect(reader.peek(), JsonToken.BeginObject)
        reader.startObject()
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "key2")
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "")
        @Expect(reader.peek(), JsonToken.EndObject)
        reader.endObject()
        @Expect(reader.peek(), JsonToken.Name)
        @Expect(reader.readName(), "key3")
        @Expect(reader.peek(), JsonToken.JsonString)
        @Expect(reader.readValue<String>(), "\\a")
        @Expect(reader.peek(), JsonToken.EndObject)
        reader.endObject()
        @Expect(reader.peek(), JsonToken.EndObject)
        reader.endObject()
    }

    @TestCase
    func jsonobjectError1(): Unit {
        let jsonStr = ##"{]"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.BeginObject)
        reader.startObject()
        try {
            reader.peek()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Expect a string as Json Name, but peeked ']'.")
        }
    }

    @TestCase
    func jsonobjectError2(): Unit {
        let jsonStr = ##"{{}}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.BeginObject)
        reader.startObject()
        try {
            reader.peek()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Expect a string as Json Name, but peeked '{'.")
        }
    }

    @TestCase
    func jsonobjectError3(): Unit {
        let jsonStr = ##""##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        try {
            reader.startObject()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "The JSON stream ends at an incorrect location.")
        }
    }

    @TestCase
    func jsonobjectError4(): Unit {
        let jsonStr = ##"}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        try {
            reader.startObject()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "The next Token is not BeginObject.")
        }
    }

    @TestCase
    func jsonobjectError5(): Unit {
        let jsonStr = ##"}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        try {
            reader.endObject()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Failed to end object.")
        }
    }

    @TestCase
    func jsonobjectError6(): Unit {
        let jsonStr = ##"{"key" "value"}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        reader.startObject()
        try {
            reader.readName()
            @Expect(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Missing ':' after name.")
        }
    }

    @TestCase
    func hashmap(): Unit {
        let jsonStr = ##"{"string1": "null", "string2": "true", "string3": "123.456e3"}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        var map = reader.readValue<HashMap<String, String>>()
        @Expect(map.toString(), "[(string1, null), (string2, true), (string3, 123.456e3)]")
    }

    @TestCase
    func hashmapArray(): Unit {
        let jsonStr = ##"{"string1": ["null"], "string2": ["true"], "string3": ["123.456e3"]}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        var map = reader.readValue<HashMap<String, Array<String>>>()
        @Expect(map.toString(), "[(string1, [null]), (string2, [true]), (string3, [123.456e3])]")
    }

    @TestCase
    func testTreeMap(): Unit {
        let jsonStr = ##"{"string1": "null", "string2": "true", "string3": "123.456e3"}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        var map = reader.readValue<TreeMap<String, String>>()
        @Expect(map.toString(), "[(string1, null), (string2, true), (string3, 123.456e3)]")
    }

    @TestCase
    func testConcurrentHashMap(): Unit {
        let jsonStr = ##"{"string1": "null", "string2": "true", "string3": "123.456e3"}"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        var map = reader.readValue<TreeMap<String, String>>()
        @Expect(map.toString(), "[(string1, null), (string2, true), (string3, 123.456e3)]")
    }

    @TestCase
    func jsonobjectToManyTop(): Unit {
        let jsonStr = ##"{"key":"value"}["value"]nulltrue123"value"123.456e3"##
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        var reader = JsonReader(bas)
        @Expect(reader.peek(), JsonToken.BeginObject)
        reader.startObject()
        @Expect(reader.readName(), "key")
        @Expect(reader.readValue<String>(), "value")
        @Expect(reader.peek(), JsonToken.EndObject)
        reader.endObject()
        @Expect(reader.peek(), JsonToken.BeginArray)
        reader.startArray()
        @Expect(reader.readValue<String>(), "value")
        @Expect(reader.peek(), JsonToken.EndArray)
        reader.endArray()
        @Expect(reader.readValue<Option<String>>(), None)
        @Expect(reader.readValue<Bool>(), true)
        @Expect(reader.readValue<Int64>(), 123)
        @Expect(reader.readValue<String>(), "value")
        @Expect(reader.readValue<Float64>(), 123456.0)
    }
}
