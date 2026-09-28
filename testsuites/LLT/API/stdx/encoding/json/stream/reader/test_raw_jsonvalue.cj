/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f --test -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_args

import stdx.encoding.json.stream.*
import std.io.*
import std.collection.*

let JSON_WHITE_SPACES = "\t\n\r "

@Test
public class RawJsonValueTest {
    @TestCase
    func trimWhiteSpace(): Unit {
        let rawJsonData = ##"{"key1": null, "key2": {"key3": "][}{"}, "key4": []}"##
        let jsonStr = "${JSON_WHITE_SPACES} ${rawJsonData} ${JSON_WHITE_SPACES}"
        var reader = makeJsonReader(jsonStr)
        let rawJsonValue = reader.readValueBytes()
        let toCheckResult = unsafe { String.fromUtf8Unchecked(rawJsonValue) }

        @Expect(rawJsonData, toCheckResult)
    }

    @TestCase
    func nextTokenValue_EndObject(): Unit {
        let rawJsonData = ""
        let jsonStr = "${JSON_WHITE_SPACES} {\"key1\": 1 ${rawJsonData} ${JSON_WHITE_SPACES} } , key :\"value\""
        var reader = makeJsonReader(jsonStr)

        reader.startObject() // resume '{'
        reader.readValueBytes() // resume '"key1": 1'
        let rawJsonValue = reader.readValueBytes() // resume before '}'
        let toCheckResult = unsafe { String.fromUtf8Unchecked(rawJsonValue) }

        @Expect(rawJsonData, toCheckResult)
    }

    @TestCase
    func nextTokenValue_EndArray(): Unit {
        let rawJsonData = ""
        let jsonStr = "[{} ${JSON_WHITE_SPACES} ${rawJsonData} ${JSON_WHITE_SPACES} ], key :\"value\""
        var reader = makeJsonReader(jsonStr)

        reader.startArray() // resume '[''
        reader.readValueBytes() // resume '{}'
        let rawJsonValue = reader.readValueBytes() // resume before ']'
        let toCheckResult = unsafe { String.fromUtf8Unchecked(rawJsonValue) }

        @Expect(rawJsonData, toCheckResult)
    }

    @TestCase
    func nextTokenValue_string(): Unit {
        let rawJsonData = ##""string""##
        let jsonStr = "${JSON_WHITE_SPACES} ${rawJsonData} ${JSON_WHITE_SPACES} :\"value\""
        var reader = makeJsonReader(jsonStr)

        let rawJsonValue = reader.readValueBytes()
        let toCheckResult = unsafe { String.fromUtf8Unchecked(rawJsonValue) }

        @Expect(rawJsonData, toCheckResult)
    }

    @TestCase
    func nextTokenValue_name(): Unit {
        let rawJsonData = ##""name" : "value""##
        let jsonStr = " { ${JSON_WHITE_SPACES} ${rawJsonData} ${JSON_WHITE_SPACES} } "
        var reader = makeJsonReader(jsonStr)

        reader.startObject() // resume '{'
        let rawJsonValue = reader.readValueBytes() // resume before '}'
        let toCheckResult = unsafe { String.fromUtf8Unchecked(rawJsonValue) }

        @Expect(rawJsonData, toCheckResult)
    }

    @TestCase
    func nextTokenValue_null(): Unit {
        let rawJsonData = ##"null"##
        let jsonStr = makeJsonStr(rawJsonData)
        var reader = makeJsonReader(jsonStr)

        let obj = JSONProps.fromJson(reader)
        let toCheckResult = unsafe { String.fromUtf8Unchecked(obj.json.raw) }

        @Expect(rawJsonData, toCheckResult)
    }

    @TestCase
    func nextTokenValue_empty(): Unit {
        // Invalid Json: should throw exception
        let rawJsonData = ##""##
        let jsonStr = makeJsonStr(rawJsonData)
        var reader = makeJsonReader(jsonStr)

        try {
            let obj = JSONProps.fromJson(reader)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Character not expected: ','.")
            return
        }
        @Expect(false, true)
    }

    @TestCase
    func nextTokenValue_value_boolean(): Unit {
        let rawJsonData = ##"true"##
        let jsonStr = makeJsonStr(rawJsonData)
        var reader = makeJsonReader(jsonStr)

        let obj = JSONProps.fromJson(reader)
        let toCheckResult = unsafe { String.fromUtf8Unchecked(obj.json.raw) }

        @Expect(rawJsonData, toCheckResult)
    }

    @TestCase
    func nextTokenValue_value_number(): Unit {
        let rawJsonData = ##"123"##
        let jsonStr = makeJsonStr(rawJsonData)
        var reader = makeJsonReader(jsonStr)

        let obj = JSONProps.fromJson(reader)
        let toCheckResult = unsafe { String.fromUtf8Unchecked(obj.json.raw) }

        @Expect(rawJsonData, toCheckResult)
    }

    @TestCase
    func nextTokenValue_Object(): Unit {
        let rawJsonData = ##"{"key1": "][}{"}"##
        let jsonStr = makeJsonStr(rawJsonData)
        var reader = makeJsonReader(jsonStr)

        let obj = JSONProps.fromJson(reader)
        let toCheckResult = unsafe { String.fromUtf8Unchecked(obj.json.raw) }

        @Expect(rawJsonData, toCheckResult)
    }

    @TestCase
    func nextTokenValue_Array(): Unit {
        let rawJsonData = ##"[{"key1": "][}{"}, {"key2": "}{]["}]"##
        let jsonStr = makeJsonStr(rawJsonData)
        var reader = makeJsonReader(jsonStr)

        let obj = JSONProps.fromJson(reader)
        let toCheckResult = unsafe { String.fromUtf8Unchecked(obj.json.raw) }

        @Expect(rawJsonData, toCheckResult)
    }

    func makeJsonStr(rawJsonData: String): String {
        let leadingJson = ##"{"id": "123", "##
        let rawJson = "\"json\":${rawJsonData}"
        let trailingJson = ##", "trailing": []}"##

        return "${leadingJson} ${JSON_WHITE_SPACES}  ${rawJson} ${JSON_WHITE_SPACES} ${trailingJson}"
    }

    func makeJsonReader(jsonStr: String): JsonReader {
        var bas = ByteBuffer()
        unsafe { bas.write(jsonStr.rawData()) }
        return JsonReader(bas)
    }
}

class JSONProps {
    var id: String = String.empty
    var json: JSON = JSON()

    public static func fromJson(reader: JsonReader): JSONProps {
        let obj = JSONProps()
        obj.fillFromJson(reader)
        return obj
    }

    public func fillFromJson(reader: JsonReader): Unit {
        let obj = this
        while (let Some(tag) <- reader.peek()) {
            match (tag) {
                case BeginObject =>
                    reader.startObject()
                    while (reader.peek() != EndObject) {
                        let name = reader.readName()
                        match (name) {
                            case "id" =>
                                if (reader.peek() == JsonToken.JsonNull) {
                                    reader.skip()
                                } else {
                                    obj.id = reader.readValue<String>()
                                }
                            case "json" => obj.json = JSON.reduceFromJson(reader)
                            case _ => reader.skip()
                        }
                    }
                    reader.endObject()
                    break
                case _ => throw Exception("Invalid Json format for JSONProps")
            }
        }
    }
}

class JSON {
    public var raw: Array<UInt8> = []

    public static func reduceFromJson(reader: JsonReader): JSON {
        let obj = JSON()
        let readRaw = reader.readValueBytes()
        obj.raw = readRaw
        return obj
    }
}
