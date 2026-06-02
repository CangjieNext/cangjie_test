/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan The index 0 of JsonArray does not exist.
// ASSERT: scan The Value of JsonObject does not exist

/*
 * Test description: Test the funcs for json_object.cj
 * Test API: public class JsonArray <: JsonValue {
 *             public func toJsonString(depth: Int64, bracketInNewLine!: Bool = false): String
 *             public operator func [](index: Int64): JsonValue
 *           }
 *           public class JsonObject <: JsonValue {
 *             public operator func [](key: String): JsonValue
 *           }
 */

import stdx.encoding.json.*

main() {
    try {
        var a = JsonArray()
        if (a.size() != 0) {
            return -1
        }
        var b = a.toJsonString(0, bracketInNewLine: true)
        if (b != "[]") {
            return -2
        }
    } catch (_) {
        return -3
    }
    try {
        var a = JsonArray()
        var b = a[0]
    } catch (e: JsonException) {
        println("The index 0 of JsonArray does not exist.")
    }
    try {
        var a = JsonArray()
        a.add(a)
        var b = a[0]
    } catch (_) {
        return -4
    }
    try {
        var a = JsonObject()
        var b = a["nihao"]
    } catch (e: JsonException) {
        println("The Value of JsonObject does not exist")
    }
    try {
        var a = JsonObject()
        a.put("nihao", a)
        var c = a["nihao"]
    } catch (_) {
        return -5
    }
    return 0
}
