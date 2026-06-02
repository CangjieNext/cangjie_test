/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.json.*
import std.io.*
import std.collection.*
import stdx.serialization.serialization.*
import stdx.encoding.json.stream.*

@Test
public class Test_json_01 {
    @TestCase
    func test_json_JsonKind(): Unit {
        var a = 0
        try {
            JsonKind.JsNull
            JsonKind.JsBool
            JsonKind.JsInt
            JsonKind.JsFloat
            JsonKind.JsString
            JsonKind.JsArray
            JsonKind.JsObject
        } catch (e: Exception) {
            a++
        }
        @Expect(a,0)
    }

    @TestCase
    func test_json_kind(): Unit {
        var a = 0
        try {
            JsonNull().kind()
            JsonBool(true).kind()
            JsonInt(123).kind()
            JsonFloat(456.0).kind()
            JsonString("cangjie").kind()
            JsonArray().kind()
            JsonObject().kind()
        } catch (e: Exception) {
            a++
        }
        @Expect(a,0)
    }

    @TestCase
    func test_json01(): Unit {
        var init1 = JsonObject()
        @Expect(init1.containsKey("123"),false)
        var hashmap = HashMap<String, JsonValue>(
            [("key1", JsonValue.fromStr("{\"key1\":{\"fieldTemp1\":-1,\"fieldTemp2\":5,\"fieldTemp3\":\"key1\"}}"))])
        var init2 = JsonObject(hashmap)
        @Expect(init2.containsKey("key1"),true)
    }

    @TestCase
    func test_json02(): Unit {
        let buffer = ByteBuffer()
        let writer = JsonWriter(buffer)
        let fmtCfg = WriteConfig.pretty
        writer.writeConfig = fmtCfg
        writer.writeValue(MyObj())
        println(String.fromUtf8(buffer.bytes()))
        @Expect(String.fromUtf8(buffer.bytes()).size,41)
    }

    @TestCase
    func test_json03(): Unit {
        let buffer = ByteBuffer()
        let writer = JsonWriter(buffer)
        let fmtCfg = WriteConfig.pretty
        writer.writeConfig = fmtCfg
        writer.writeValue(MyObj())
        println(String.fromUtf8(buffer.bytes()))
        @Expect(String.fromUtf8(buffer.bytes()).size,41)
    }
}

class MyObj <: JsonSerializable {
    public func toJson(w: JsonWriter): Unit {
        w.startObject()
        w.writeName("Name").writeValue("zhangsan")
        w.writeName("Age").writeValue(18)
        w.endObject()
        w.flush()
    }
}
