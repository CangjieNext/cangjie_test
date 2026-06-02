/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt  %f -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:scan toJsonString success
// ASSERT:scan jsonArray[] success
// ASSERT:scan jsonArray[] case None success
// ASSERT:scan jsonObject[] success
// ASSERT:scan jsonObject[] case None success
// ASSERT:scan json lineStartPos success

/*
 * Test description: Test the funcs of toJsonString and operator overloading of brackets
 * Test API:
 *      public class JsonArray <: JsonValue
 *          public func toJsonString()
 *          public func toJsonString(depth: Int64, bracketInNewLine!: Bool = false): String
 *          public operator func [](index: Int64): JsonValue
 *      public class JsonObject <: JsonValue
 *          public operator func [](key: String): JsonValue
 */

import stdx.encoding.json.*

main(): Int64 {
    var jsonStr = "[[]]"
    var expValue = """
[
  []
]"""
    var jsonValue = JsonValue.fromStr(jsonStr)
    var actValue = jsonValue.asArray().toJsonString()
    if (actValue == expValue) {
        println("toJsonString success")
    }
    var arrayStr = "[1,2]"
    if (JsonValue.fromStr(arrayStr).asArray()[0].asInt().getValue() == 1) {
        println("jsonArray[] success")
    }
    try {
        JsonValue.fromStr(arrayStr).asArray()[2]
    } catch (e: JsonException) {
        println("jsonArray[] case None success")
    }
    var objectStr = "{\"key1\":1,\"key2\":2}"
    if (JsonValue.fromStr(objectStr).asObject()["key1"].asInt().getValue() == 1) {
        println("jsonObject[] success")
    }
    try {
        JsonValue.fromStr(objectStr).asObject()["key3"]
    } catch (e: JsonException) {
        println("jsonObject[] case None success")
    }

    var errStr = """
[
  [1,]
]"""
    try {
        JsonValue.fromStr(errStr)
    } catch (e: JsonException) {
        println("json lineStartPos success")
    }
    return 0
}
