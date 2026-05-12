/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output  %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.json.*
import std.collection.*

var jsonArray01 = JsonArray()
var str1 = "[true,\"kjjjke\",{\"sdfd\":\"ggggg\",\"eeeee\":[341,false,{\"nnnn\":55.87}]},3422,22.341,false,[22,22.22,true,\"ddd\"],43]"
var jsonValue01 = JsonValue.fromStr(str1)
var jsonArray02 = JsonArray(Array<JsonValue>())
var jsonArray03 = JsonArray(ArrayList<JsonValue>())
var jsonArray04 = JsonArray([jsonValue01])
var jsonArray05 = JsonArray(ArrayList<JsonValue>([jsonValue01]))

@Test
class Test_jsonarray_tojsonstring_01 {
    @TestCase
    func test_tojsonstring_01(): Unit {
        @Expect(jsonArray01.toJsonString(2 ,bracketInNewLine:false, indent:"  "), "[]")
        @Expect(jsonArray02.toJsonString(2 ,bracketInNewLine:false, indent:"  "), "[]")
        @Expect(jsonArray03.toJsonString(2 ,bracketInNewLine:false, indent:"  "), "[]")
    }

    @TestCase
    func test_tojsonstring_02(): Unit {
        @Expect(jsonArray01.toJsonString(2 ,bracketInNewLine:false, indent:"\t\t"), "[]")
        @Expect(jsonArray02.toJsonString(2 ,bracketInNewLine:false, indent:"\t\t"), "[]")
        @Expect(jsonArray03.toJsonString(2 ,bracketInNewLine:false, indent:"\t\t"), "[]")
    }

    @TestCase
    func test_tojsonstring_03(): Unit {
        @Expect(jsonArray01.toJsonString(2 ,bracketInNewLine:false, indent:" \t"), "[]")
        @Expect(jsonArray02.toJsonString(2 ,bracketInNewLine:false, indent:" \t"), "[]")
        @Expect(jsonArray03.toJsonString(2 ,bracketInNewLine:false, indent:" \t"), "[]")
    }

    @TestCase
    func test_tojsonstring_04(): Unit {
        @Expect(jsonArray01.toJsonString(2 ,bracketInNewLine:false, indent:"\t "), "[]")
        @Expect(jsonArray02.toJsonString(2 ,bracketInNewLine:false, indent:"\t "), "[]")
        @Expect(jsonArray03.toJsonString(2 ,bracketInNewLine:false, indent:"\t "), "[]")
    }

    @TestCase
    func test_tojsonstring_05(): Unit {
        @Expect(jsonArray01.toJsonString(2 ,bracketInNewLine:false, indent:" "), "[]")
        @Expect(jsonArray02.toJsonString(2 ,bracketInNewLine:false, indent:" "),"[]")
        @Expect(jsonArray03.toJsonString(2 ,bracketInNewLine:false, indent:" "), "[]")
    }

    @TestCase
    func test_tojsonstring_06(): Unit {
        @Expect(jsonArray01.toJsonString(2 ,bracketInNewLine:false, indent:""), "[]")
        @Expect(jsonArray02.toJsonString(2 ,bracketInNewLine:false, indent:""), "[]")
        @Expect(jsonArray03.toJsonString(2 ,bracketInNewLine:false, indent:""), "[]")
    }

    @TestCase
    func test_tojsonstring_07(): Unit {
        try {
            jsonArray01.toJsonString(2, bracketInNewLine: false, indent: "\0")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Indent must be an empty string or any combination of spaces and tabs.")
        }

        try {
            jsonArray02.toJsonString(2, bracketInNewLine: false, indent: "\0")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Indent must be an empty string or any combination of spaces and tabs.")
        }

        try {
            jsonArray03.toJsonString(2, bracketInNewLine: false, indent: "\0")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Indent must be an empty string or any combination of spaces and tabs.")
        }
    }

    @TestCase
    func test_tojsonstring_08(): Unit {
        try {
            jsonArray01.toJsonString(2, bracketInNewLine: false, indent: "cangjietest")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Indent must be an empty string or any combination of spaces and tabs.")
        }

        try {
            jsonArray02.toJsonString(2, bracketInNewLine: false, indent: "cangjietest")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Indent must be an empty string or any combination of spaces and tabs.")
        }

        try {
            jsonArray03.toJsonString(2, bracketInNewLine: false, indent: "cangjietest")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Indent must be an empty string or any combination of spaces and tabs.")
        }
    }
}
