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

var jsonObject01 = JsonObject()
var str1 = "{\"sdfd\":\"ggggg\",\"eeeee\":[341,false,{\"nnnn\":55.87}]}"
var jsonValue01 = JsonValue.fromStr(str1)
var jsonObject02 = jsonValue01.asObject()

@Test
class Test_jsonobject_tojsonstring_01 {
    @TestCase
    func test_tojsonstring_01(): Unit {
        @Expect(jsonObject01.toJsonString(2 ,bracketInNewLine:false, indent:"  "), "{}")
    }

    @TestCase
    func test_tojsonstring_02(): Unit {
        @Expect(jsonObject01.toJsonString(2 ,bracketInNewLine:false, indent:"\t\t"), "{}")
    }

    @TestCase
    func test_tojsonstring_03(): Unit {
        @Expect(jsonObject01.toJsonString(2 ,bracketInNewLine:false, indent:" \t"), "{}")
    }

    @TestCase
    func test_tojsonstring_04(): Unit {
        @Expect(jsonObject01.toJsonString(2 ,bracketInNewLine:false, indent:"\t "), "{}")
    }

    @TestCase
    func test_tojsonstring_05(): Unit {
        @Expect(jsonObject01.toJsonString(2 ,bracketInNewLine:false, indent:" "), "{}")
    }

    @TestCase
    func test_tojsonstring_06(): Unit {
        @Expect(jsonObject01.toJsonString(2 ,bracketInNewLine:false, indent:""), "{}")
    }

    @TestCase
    func test_tojsonstring_07(): Unit {
        try {
            jsonObject01.toJsonString(2, bracketInNewLine: false, indent: "\0")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Indent must be an empty string or any combination of spaces and tabs.")
        }

        try {
            jsonObject02.toJsonString(2, bracketInNewLine: false, indent: "\0")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Indent must be an empty string or any combination of spaces and tabs.")
        }
    }

    @TestCase
    func test_tojsonstring_08(): Unit {
        try {
            jsonObject01.toJsonString(2, bracketInNewLine: false, indent: "testcang")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Indent must be an empty string or any combination of spaces and tabs.")
        }

        try {
            jsonObject02.toJsonString(2, bracketInNewLine: false, indent: "testcang")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Indent must be an empty string or any combination of spaces and tabs.")
        }
    }
}
